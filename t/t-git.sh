#!/bin/sh
# Testing git integrity?

#Load testing harness
. ./harness.sh

# Declare description and number of checks
plan 'Graudit repo tests' 1 

# TESTS
ok 'No outstanding commits' 'git status|grep -v "working directory clean"'
