#!/bin/sh
# Testing description

#Load testing harness
. ./harness.sh

# Declare description and number of checks
plan 'blank test' 2 

# TESTS
ok 'working command' '../graudit something'
not_ok 'bad command' './graudit something'
