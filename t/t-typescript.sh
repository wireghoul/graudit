#!/bin/sh
# Testing Typescript signatures and invocation

test_description='Typescript signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Typescript signature syntax test' '../graudit -d ../signatures/typescript.db anotherfile'
test_expect_code 1 'Typescript context argument' '../graudit -c 5 -d ../signatures/typescript.db anotherfile'
test_expect_code 1 'Typescript no color test' '../graudit -z -d ../signatures/typescript.db anotherfile'
test_expect_code 2 'Typescript no such file test' '../graudit -d ../signatures/typescript.db nosuchfile'
test_expect_success 'Typescript broken rules test' 'test $(../graudit -B -z -d ../signatures/typescript.db nomatch.txt | wc -l) -eq 0'
test_done
