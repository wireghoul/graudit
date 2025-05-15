#!/bin/bash
# iterate through every git commit and run graudit rules against the diff... do the same on a branch if specified

# Display help string for -h/--help
if [[ "$1" =~ ^-.+ ]]; then
    echo "Usage: $0 <db> <branch>"
    exit
fi

# Default to secrets db unless one is specified
DB=${1:-secrets}

# Default to current branch if none specified
BRANCH=${2:-$(git rev-parse --abbrev-ref HEAD 2>&1)}
if [[ "$BRANCH" =~ ^fatal: ]]; then
    echo $BRANCH
    exit 2
fi

# Check if db is valid
if [[ ! -e $DB ]]; then
    RESULT=$(graudit -B -d $DB /dev/null 2>&1)
    if [[ "$RESULT" =~ database\ path\ not\ found ]]; then
        echo "Invalid database specified"
        exit 2
    fi
fi 

echo "Running graudit with $DB on commits in branch: $BRANCH"

# Get all commit hashes for the branch
COMMITS=$(git log --pretty=format:"%H" $BRANCH)

# Loop through each commit
for COMMIT in $COMMITS; do
    echo -n "Checking commit $COMMIT... "
    
    # Search for patterns in this commit
    RESULT=$(git show $COMMIT | graudit -B -c 0 -d "$DB" /dev/stdin)
    
    if [ -n "$RESULT" ]; then
        echo "FOUND MATCH!"
        echo "$RESULT"
    else
        echo "No matches"
    fi
done




