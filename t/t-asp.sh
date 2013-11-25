#!/bin/sh
# Testing all signatures and invocation

test_description='Asp signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'ASP signature syntax test' '../graudit -d ../signatures/asp anotherfile'
test_expect_code 1 'ASP context argument' '../graudit -c 5 -d ../signatures/asp anotherfile'
test_expect_code 1 'ASP no color test' '../graudit -z -d ../signatures/asp anotherfile'
test_expect_code 2 'ASP no such file test' '../graudit -d ../signatures/asp nosuchfile'
test_done
