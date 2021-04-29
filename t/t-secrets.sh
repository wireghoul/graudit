#!/bin/sh
# Testing Secrets signatures and invocation

test_description='Secrets signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Secrets signature syntax test' '../graudit -d ../signatures/secrets.db anotherfile'
test_expect_code 1 'Secrets context argument' '../graudit -c 5 -d ../signatures/secrets.db anotherfile'
test_expect_code 1 'Secrets no color test' '../graudit -z -d ../signatures/secrets.db anotherfile'
test_expect_code 2 'Secrets no such file test' '../graudit -d ../signatures/secrets.db nosuchfile'
test_expect_success 'Secrets broken rules test' 'test $(../graudit -B -z -d ../signatures/secrets.db nomatch.txt | wc -l) -eq 0'
test_done
