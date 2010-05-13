#!/bin/sh
# Testing other signatures and invocation

test_description='Other signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Other signature syntax test' '../graudit -d other anotherfile'
test_expect_code 1 'Other context argument' '../graudit -c 5 -d other anotherfile'
test_expect_code 1 'Other no color test' '../graudit -z -d other anotherfile'
test_expect_code 2 'Other no such file test' '../graudit -d other nosuchfile'
test_done
