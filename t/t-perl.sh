#!/bin/sh
# Testing perl signatures and invocation

#Load testing harness
. ./harness.sh

# Declare description and number of checks
plan 'perl tests' 4 

# TESTS
ok 'perl signature syntax test' '../graudit -d perl anotherfile' 
ok 'perl context argument' '../graudit -c 5 -d perl anotherfile'
ok 'perl no color test' '../graudit -z -d perl anotherfile'
not_ok 'perl no such file test' '../graudit -d perl nosuchfile'
