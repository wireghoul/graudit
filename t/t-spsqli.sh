#!/bin/sh
# Testing spsqli signatures and invocation

test_description='spsqli signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'spsqli signature syntax test' '../graudit -d ../signatures/spsqli.db anotherfile'
test_expect_code 1 'spsqli context argument' '../graudit -c 5 -d ../signatures/spsqli.db anotherfile'
test_expect_code 1 'spsqli no color test' '../graudit -z -d ../signatures/spsqli.db anotherfile'
test_expect_code 2 'spsqli no such file test' '../graudit -d ../signatures/spsqli.db nosuchfile'
test_expect_success 'spsqli broken rules test' 'test $(../graudit -B -z -d ../signatures/spsqli.db nomatch.txt | wc -l) -eq 0'
test_done
