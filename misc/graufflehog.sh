#!/bin/bash
# Script that used find and graudit to audit a directory for "secrets"
# Useful for decompiled jar files, extracted firmware images etc.
if [ -z $1 ]; then
    print "Usage: $0 <directory>"
    exit 2
fi
echo "Looking for interresting files"
echo "-----------------------------------"
find $1 \( -iname '*.conf' -o -iname '*.cnf' -o -iname '*.key' -o -iname '.id_rsa' -o -iname '*.pem' -o -iname '*.jks' \) 2>/dev/null 

echo ""
echo "Running graudit with secrets.db"
echo "-----------------------------------" 
graudit -d secrets $1
