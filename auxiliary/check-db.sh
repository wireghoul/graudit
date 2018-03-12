#!/bin/sh
# Quick script to check if a file is a valid graudit db

if [ -z $1 ]; then 
    echo "Usage $0 <file to check>"
    exit 1
fi
grep -Ef $1 /proc/self >/dev/null
if [ $? -eq 2 ]; then
    echo "Bad signature in database: $1"
    exit 1
fi
grep -E '^\s*$' $1 >/dev/null
if [ $? -eq 0 ]; then
    echo "Blank line in database: $1"
    exit 1
fi
echo "Database $1 appears to be valid"
