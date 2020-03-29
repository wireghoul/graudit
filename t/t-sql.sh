#!/bin/sh
# Testing SQL signatures and invocation

test_description='SQL signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'SQL signature syntax test' '../graudit -d ../signatures/sql.db anotherfile'
test_expect_code 1 'SQL context argument' '../graudit -c 5 -d ../signatures/sql.db anotherfile'
test_expect_code 1 'SQL no color test' '../graudit -z -d ../signatures/sql.db anotherfile'
test_expect_code 2 'SQL no such file test' '../graudit -d ../signatures/sql.db nosuchfile'
test_done
