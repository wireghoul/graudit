#!/bin/sh
# Testing JS signatures and invocation

test_description='JS signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'JS signature syntax test' '../graudit -d ../signatures/js.db anotherfile'
test_expect_code 1 'JS context argument' '../graudit -c 5 -d ../signatures/js.db anotherfile'
test_expect_code 1 'JS no color test' '../graudit -z -d ../signatures/js.db anotherfile'
test_expect_code 2 'JS no such file test' '../graudit -d ../signatures/js.db nosuchfile'
test_expect_success 'JS broken rules test' 'test $(../graudit -B -z -d ../signatures/js.db nomatch.txt | wc -l) -eq 0'
test_done
