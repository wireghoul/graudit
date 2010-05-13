#!/bin/sh
# Testing python signatures and invocation

test_description='Python signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Python signature syntax test' '../graudit -d python anotherfile'
test_expect_code 1 'Python context argument' '../graudit -c 5 -d python anotherfile'
test_expect_code 1 'Python no color test' '../graudit -z -d python anotherfile'
test_expect_code 2 'Python no such file test' '../graudit -d python nosuchfile'
test_done
