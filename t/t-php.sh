#!/bin/sh
# Testing php signatures and invocation

#Load testing harness
. ./harness.sh

# Declare description and number of checks
plan 'PHP tests' 4 

# TESTS
ok 'PHP signature syntax test' '../graudit -d php anotherfile'
ok 'PHP context argument' '../graudit -c 5 -d php anotherfile'
ok 'PHP no color test' '../graudit -z -d php anotherfile'
not_ok 'PHP no such file test' '../graudit -d php nosuchfile'
