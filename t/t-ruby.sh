#!/bin/sh
# Testing Ruby signatures and invocation

test_description='Ruby signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Ruby signature syntax test' '../graudit -d ../signatures/ruby.db anotherfile'
test_expect_code 1 'Ruby context argument' '../graudit -c 5 -d ../signatures/ruby.db anotherfile'
test_expect_code 1 'Ruby no color test' '../graudit -z -d ../signatures/ruby.db anotherfile'
test_expect_code 2 'Ruby no such file test' '../graudit -d ../signatures/ruby.db nosuchfile'
test_done
