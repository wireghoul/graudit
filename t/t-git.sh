#!/bin/sh
# Testing git integrity?

#Load testing harness
. ./harness.sh

# Declare description and number of checks
plan 'Graudit repo tests' 1 

# TESTS
not_ok 'No outstanding commits' 'git status|grep -v "working directory clean"'
