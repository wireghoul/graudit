#!/bin/sh
# Testing nim signatures and invocation

test_description='Nim signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Nim signature syntax test' '../graudit -d nim anotherfile'
test_expect_code 1 'Nim context argument' '../graudit -c 5 -d nim anotherfile'
test_expect_code 1 'Nim no color test' '../graudit -z -d nim anotherfile'
test_expect_code 2 'Nim no such file test' '../graudit -d nim nosuchfile'
test_done
