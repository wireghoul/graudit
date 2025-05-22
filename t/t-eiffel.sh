#!/bin/sh
# Testing Eiffel signatures and invocation

test_description='Eiffel signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Eiffel signature syntax test' '../graudit -d ../signatures/eiffel.db anotherfile'
test_expect_code 1 'Eiffel context argument' '../graudit -c 5 -d ../signatures/eiffel.db anotherfile'
test_expect_code 1 'Eiffel no color test' '../graudit -z -d ../signatures/eiffel.db anotherfile'
test_expect_code 2 'Eiffel no such file test' '../graudit -d ../signatures/eiffel.db nosuchfile'
test_expect_success 'Eiffel broken rules test' 'test $(../graudit -B -z -d ../signatures/eiffel.db nomatch.txt | wc -l) -eq 0'
test_done
