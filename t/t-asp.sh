#!/bin/sh
# Testing asp signatures and invocation

#Load testing harness
. ./harness.sh

# Declare description and number of checks
plan 'Asp tests' 4 

# TESTS
ok 'Asp signature syntax test' '../graudit -d asp anotherfile'
ok 'Asp context argument' '../graudit -c 5 -d asp anotherfile'
ok 'Asp no color test' '../graudit -z -d asp anotherfile'
not_ok 'Asp no such file test' '../graudit -d asp nosuchfile'
