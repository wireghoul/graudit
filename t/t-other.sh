#!/bin/sh
# Testing other signatures and invocation

test_description='Other signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Other signature syntax test' '../graudit -d ../signatures/other.db anotherfile'
test_expect_code 1 'Other context argument' '../graudit -c 5 -d ../signatures/other.db anotherfile'
test_expect_code 1 'Other no color test' '../graudit -z -d ../signatures/other.db anotherfile'
test_expect_code 2 'Other no such file test' '../graudit -d ../signatures/other.db nosuchfile'
test_done
