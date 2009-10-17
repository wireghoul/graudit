#!/bin/sh
# Testing other signatures and invocation

#Load testing harness
. ./harness.sh

# Declare description and number of checks
plan 'other tests' 4 

# TESTS
ok 'other signature syntax test' '../graudit -d other anotherfile' 
ok 'other context argument' '../graudit -c 5 -d other anotherfile'
ok 'other no color test' '../graudit -z -d other anotherfile'
not_ok 'other no such file test' '../graudit -d other nosuchfile'
