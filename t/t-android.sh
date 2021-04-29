#!/bin/sh
# Testing Android signatures and invocation

test_description='Android signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Android signature syntax test' '../graudit -d ../signatures/android.db anotherfile'
test_expect_code 1 'Android context argument' '../graudit -c 5 -d ../signatures/android.db anotherfile'
test_expect_code 1 'Android no color test' '../graudit -z -d ../signatures/android.db anotherfile'
test_expect_code 2 'Android no such file test' '../graudit -d ../signatures/android.db nosuchfile'
test_expect_success 'Android broken rules test' 'test $(../graudit -B -z -d ../signatures/android.db nomatch.txt | wc -l) -eq 0'
test_done
