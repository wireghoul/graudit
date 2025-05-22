#!/bin/sh
# Testing JWT signatures and invocation

test_description='JWT signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'JWT signature syntax test' '../graudit -d ../signatures/jwt.db anotherfile'
test_expect_code 1 'JWT context argument' '../graudit -c 5 -d ../signatures/jwt.db anotherfile'
test_expect_code 1 'JWT no color test' '../graudit -z -d ../signatures/jwt.db anotherfile'
test_expect_code 2 'JWT no such file test' '../graudit -d ../signatures/jwt.db nosuchfile'
test_expect_success 'JWT broken rules test' 'test $(../graudit -B -z -d ../signatures/jwt.db nomatch.txt | wc -l) -eq 0'
test_done
