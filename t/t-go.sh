#!/bin/sh
# Testing Go signatures and invocation

test_description='Go signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Go signature syntax test' '../graudit -d ../signatures/go.db anotherfile'
test_expect_code 1 'Go context argument' '../graudit -c 5 -d ../signatures/go.db anotherfile'
test_expect_code 1 'Go no color test' '../graudit -z -d ../signatures/go.db anotherfile'
test_expect_code 2 'Go no such file test' '../graudit -d ../signatures/go.db nosuchfile'
test_done
