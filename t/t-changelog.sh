#!/bin/sh
# Ensure changelog version and script versions match

#Load testing harness
. ./harness.sh

# Declare description and number of checks
plan 'changelog updated' 2 

# TESTS
head -1 ../Changelog| cut -f1>ver1
../graudit -v | cut -d" " -f3>ver2

# Harness need stricter checks
ok 'changelog version' 'grep -f ver1 ver2'
ok 'script version' 'grep -f ver2 ver1'

rm ver1
rm ver2
