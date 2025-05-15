#!/bin/bash

# Get the SVN URL for the specific path
echo "Getting revision history for this path..."

# Get all revisions for this specific path
REVISIONS=$(svn log -q | grep -E '^r[0-9]+' | awk '{print $1}' | sed 's/r//')

# Count total revisions to scan
TOTAL_REVS=$(echo "$REVISIONS" | wc -l)
echo "Found $TOTAL_REVS revisions to scan"

# Loop through each revision
for REV in $REVISIONS; do
    ((CURRENT++))
    echo -n "Checking revision $REV ($CURRENT/$TOTAL_REVS)... "
    
    # Get the previous revision
#    PREV_REV=$((REV-1))
    
    # Search for password patterns in this revision
    RESULT=$(svn log -c $REV 2>/dev/null | grep -Ei '(security|sqli|sql inj|xss| rce |command injection|vulnerability|cmdi| lfi |traversal)')
    
    if [ -n "$RESULT" ]; then
        echo "$RVE matches"
        echo $RESULT
	echo "show $diff ?"
  	read -n1 -s -p $'Press enter to continue...any other key to skip...\n' key
  	if [ "$key" = '' ]; then
      	    svn diff -c $REV
  	fi
    else
        echo "No matches"
    fi
done

