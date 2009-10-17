#!/bin/sh
# Testing jsp signatures and invocation

#Load testing harness
. ./harness.sh

# Declare description and number of checks
plan 'jsp tests' 4 

# TESTS
ok 'jsp signature syntax test' '../graudit -d jsp anotherfile' 
ok 'jsp context argument' '../graudit -c 5 -d jsp anotherfile'
ok 'jsp no color test' '../graudit -z -d jsp anotherfile'
not_ok 'jsp no such file test' '../graudit -d jsp nosuchfile'
