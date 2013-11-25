#!/bin/sh
# Testing default signatures and invocation

test_description='Default signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Default signature syntax test' '../graudit -d ../signatures/default.db anotherfile'
test_expect_code 1 'Default context argument' '../graudit -c 5 -d ../signatures/default.db anotherfile'
test_expect_code 1 'Default no color test' '../graudit -z -d ../signatures/default.db anotherfile'
test_expect_code 2 'Default no such file test' '../graudit -d ../signatures/default.db nosuchfile'
test_done
