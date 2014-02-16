#!/bin/sh
# Testing strings signatures and invocation

test_description='Strings signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Other signature syntax test' '../graudit -d ../signatures/strings.db anotherfile'
test_expect_code 1 'Other context argument' '../graudit -c 5 -d ../signatures/strings.db anotherfile'
test_expect_code 1 'Other no color test' '../graudit -z -d ../signatures/strings.db anotherfile'
test_expect_code 2 'Other no such file test' '../graudit -d ../signatures/strings.db nosuchfile'
test_done
