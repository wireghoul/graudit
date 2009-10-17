#!/bin/sh
# Testing default signatures and invocation

#Load testing harness
. ./harness.sh

# Declare description and number of checks
plan 'default signature tests' 4 

# TESTS
ok 'default signature syntax test' '../graudit anotherfile' 
ok 'default context argument' '../graudit -c 5 anotherfile'
ok 'default no color test' '../graudit -z anotherfile'
not_ok 'default no such file test' '../graudit nosuchfile'
