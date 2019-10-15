#!/bin/sh
#testing C taint
echo 'char[[:space:]]+[a-zA-Z0-9\.\-\_][a-zA-Z0-9\.\-\_]+\[' | \
graudit -B -z -d /dev/stdin -c 0 $1 | \
perl -ne 'if ($_ =~ m/char\s+([a-zA-Z0-9\.\-\_]+)\[/) { print "$1\n"; }' | sort -u > /tmp/test
while read var; do
  echo "(memcpy|strcat|strcpy|sprintf).*$var"
done </tmp/test | \
graudit -B -z -d /dev/stdin -c 0 $1 | \
grep -o -f /tmp/test | sort -u > /tmp/taint
while read var; do
   echo "char[[:space:]]+[\*]?$var\["
   echo "(memcpy|strcat|strcpy|sprintf).*$var"
done </tmp/taint | \
graudit -c 3 -d /dev/stdin $1
