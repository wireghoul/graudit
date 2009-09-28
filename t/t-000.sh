#!/bin/sh
# Testing invocation and command arguments

#Load testing harness
. ./harness.sh

# Declare description and number of checks
plan 'invocation checks' 3

# TESTS
ok 'version check' '../graudit -v'
not_ok 'usage check' '../graudit'
not_ok 'bad argument' '../graudit -99'
