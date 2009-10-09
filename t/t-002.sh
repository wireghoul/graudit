#!/bin/sh
# Ensure changelog version and script versions match

#Load testing harness
. ./harness.sh

# Declare description and number of checks
plan 'changelog updated' 1 

# TESTS

# Not posix compliant
ok 'changelog version' 'test $(head -1 ../Changelog| cut -f1) == $(../graudit -v | cut -d' ' -f3)'
