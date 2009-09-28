#!/bin/sh
#Test invocations

#Load testing harness
. ./harness.sh

# Declare description and number of checks
plan 'Signature syntax checks' 6

# TESTS
ok 'default db' '../graudit -d default anotherfile'
ok 'other db' '../graudit -d other anotherfile'
ok 'perl db' '../graudit -d perl anotherfile'
ok 'php db' '../graudit -d php anotherfile'
ok 'python db' '../graudit -d python anotherfile'
ok 'rough db' '../graudit -d rough anotherfile'
