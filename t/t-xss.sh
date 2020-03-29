#!/bin/sh
# Testing XSS signatures and invocation

test_description='XSS signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'XSS signature syntax test' '../graudit -d ../signatures/xss.db anotherfile'
test_expect_code 1 'XSS context argument' '../graudit -c 5 -d ../signatures/xss.db anotherfile'
test_expect_code 1 'XSS no color test' '../graudit -z -d ../signatures/xss.db anotherfile'
test_expect_code 2 'XSS no such file test' '../graudit -d ../signatures/xss.db nosuchfile'
test_done
