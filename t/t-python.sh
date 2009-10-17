#!/bin/sh
# Testing python signatures and invocation

#Load testing harness
. ./harness.sh

# Declare description and number of checks
plan 'python tests' 4 

# TESTS
ok 'python signature syntax test' '../graudit -d python anotherfile' 
ok 'python context argument' '../graudit -c 5 -d python anotherfile'
ok 'python no color test' '../graudit -z -d python anotherfile'
not_ok 'python no such file test' '../graudit -d python nosuchfile'
