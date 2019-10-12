#!/bin/sh
# PHP taint checking with graudit - PoC script
# Written by Wireghoul - http://www.justanotherhacker.com
# Released under the GPL licence
VERSION=0.1
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/check"
    exit 2
fi
RCEHOME=`dirname $0`
graudit -z -c 0 -d $RCEHOME/rce.db "$1" | \
perl -ne 'while ($_ =~ m!\$([a-z0-9-_\[\]\x27\>]+)!gi) { print "\\\$$1\n"; print "include\nrequire\n"; }' | \
sed -e's/\[/\\[/g' -e's/\]/\\]/g' | \
sort | uniq | \
graudit -d /dev/stdin "$1"
#more
