#!/bin/sh
# Testing Fruit signatures and invocation

test_description='Fruit signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Fruit signature syntax test' '../graudit -d ../signatures/fruit.db anotherfile'
test_expect_code 1 'Fruit context argument' '../graudit -c 5 -d ../signatures/fruit.db anotherfile'
test_expect_code 1 'Fruit no color test' '../graudit -z -d ../signatures/fruit.db anotherfile'
test_expect_code 2 'Fruit no such file test' '../graudit -d ../signatures/fruit.db nosuchfile'
test_expect_success 'Fruit broken rules test' 'test $(../graudit -B -z -d ../signatures/fruit.db nomatch.txt | wc -l) -eq 0'
test_done
