#!/bin/sh
# Testing php signatures and invocation

test_description='PHP signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'PHP signature syntax test' '../graudit -d php anotherfile'
test_expect_code 1 'PHP context argument' '../graudit -c 5 -d php anotherfile'
test_expect_code 1 'PHP no color test' '../graudit -z -d php anotherfile'
test_expect_code 2 'PHP no such file test' '../graudit -d php nosuchfile'
test_done
