#!/bin/bash

# iterate through every svn commit and run graudit rules against the diff... do the same on a branch if specified

# Display help string for -h/--help
if [[ "$1" =~ ^-.+ ]]; then
    echo "Usage: $0 <db> <branch>"
    exit
fi

DB=${1:-secrets}

SVN_PATH=${2:-.}

# Get the SVN URL for the specific path
# SVN_URL=$(svn info --show-item url "$SVN_PATH")
# It's never used again.....

# Check if db is valid
if [[ ! -e $DB ]]; then
    RESULT=$(graudit -B -d $DB /dev/null 2>&1)
    if [[ "$RESULT" =~ database\ path\ not\ found ]]; then
        echo "Invalid database specified"
        exit 2
    fi
fi

echo "Running graudit with $DB on commits in branch: $BRANCH"

# Get all revisions for this specific path
REVISIONS=$(svn log -q "$SVN_PATH" | grep -E '^r[0-9]+' | awk '{print $1}' | sed 's/r//')

# Count total revisions to scan
#TOTAL_REVS=$(echo "$REVISIONS" | wc -l)
#echo "Found $TOTAL_REVS revisions to scan"

# Counter for tracking matches
#MATCHES=0
#CURRENT=0

# Loop through each revision
for REV in $REVISIONS; do
    #((CURRENT++))
    echo -n "Checking revision $REV... " # ($CURRENT/$TOTAL_REVS)... "
    
    # Get the previous revision
    PREV_REV=$((REV-1))
    
    # Search for patterns in this revision
    RESULT=$(svn diff -r $PREV_REV:$REV "$SVN_PATH" 2>/dev/null | graudit -B -c 0 -d "$DB" /dev/stdin)
    
    if [ -n "$RESULT" ]; then
        echo "FOUND MATCH!"
        echo "$RESULT"
#        ((MATCHES++))
    else
        echo "No matches"
    fi
done

