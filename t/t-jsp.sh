#!/bin/sh
# Testing jsp signatures and invocation

test_description='JSP signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'JSP signature syntax test' '../graudit -d jsp anotherfile'
test_expect_code 1 'JSP context argument' '../graudit -c 5 -d jsp anotherfile'
test_expect_code 1 'JSP no color test' '../graudit -z -d jsp anotherfile'
test_expect_code 2 'JSP no such file test' '../graudit -d jsp nosuchfile'
test_done
