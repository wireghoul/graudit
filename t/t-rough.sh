#!/bin/sh
# Testing rough signatures and invocation

#Load testing harness
. ./harness.sh

# Declare description and number of checks
plan 'rough signature tests' 4 

# TESTS
ok 'rough signature syntax test' '../graudit -d rough anotherfile' 
ok 'rough context argument' '../graudit -c 5 -d rough anotherfile'
ok 'rough no color test' '../graudit -z -d rough anotherfile'
not_ok 'rough no such file test' '../graudit -d rough nosuchfile'
