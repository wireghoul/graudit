#!/bin/sh
# Testing all signatures and invocation

test_description='All signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'All signature syntax test' '../graudit -d ../signatures/all.db anotherfile'
test_expect_code 1 'All context argument' '../graudit -c 5 -d ../signatures/all.db anotherfile'
test_expect_code 1 'All no color test' '../graudit -z -d ../signatures/all.db anotherfile'
test_expect_code 2 'All no such file test' '../graudit -d ../signatures/all.db nosuchfile'
test_done
