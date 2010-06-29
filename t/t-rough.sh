#!/bin/sh
# Testing rough signatures and invocation

test_description='Rough signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Rough signature syntax test' '../graudit -d rough anotherfile'
test_expect_code 1 'Rough context argument' '../graudit -c 5 -d rough anotherfile'
test_expect_code 1 'Rough no color test' '../graudit -z -d rough anotherfile'
test_expect_code 2 'Rough no such file test' '../graudit -d rough nosuchfile'
test_done
