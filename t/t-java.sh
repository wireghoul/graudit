#!/bin/sh
# Testing jsp signatures and invocation

test_description='Java/jsp signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Java signature syntax test' '../graudit -d ../signatures/java.db anotherfile'
test_expect_code 1 'Java context argument' '../graudit -c 5 -d ../signatures/java.db anotherfile'
test_expect_code 1 'Java no color test' '../graudit -z -d ../signatures/java.db anotherfile'
test_expect_code 2 'Java no such file test' '../graudit -d ../signatures/java.db nosuchfile'
test_expect_success 'Java broken rules test' 'test $(../graudit -B -z -d ../signatures/java.db nomatch.txt | wc -l) -eq 0'
test_done
