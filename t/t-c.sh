#!/bin/sh
# Testing php signatures and invocation

test_description='C signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'C signature syntax test' '../graudit -d c anotherfile'
test_expect_code 1 'C context argument' '../graudit -c 5 -d c anotherfile'
test_expect_code 1 'C no color test' '../graudit -z -d c anotherfile'
test_expect_code 2 'C no such file test' '../graudit -d c nosuchfile'
test_done
