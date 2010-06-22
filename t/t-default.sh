#!/bin/sh
# Testing default signatures and invocation

test_description='Default signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Default signature syntax test' '../graudit -d default anotherfile'
test_expect_code 1 'Default context argument' '../graudit -c 5 -d default anotherfile'
test_expect_code 1 'Default no color test' '../graudit -z -d default anotherfile'
test_expect_code 2 'Default no such file test' '../graudit -d default nosuchfile'
test_done
