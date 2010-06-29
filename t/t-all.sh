#!/bin/sh
# Testing all signatures and invocation

test_description='All signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'All signature syntax test' '../graudit -d all anotherfile'
test_expect_code 1 'All context argument' '../graudit -c 5 -d all anotherfile'
test_expect_code 1 'All no color test' '../graudit -z -d all anotherfile'
test_expect_code 2 'All no such file test' '../graudit -d all nosuchfile'
test_done
