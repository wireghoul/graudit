#!/bin/sh
# Testing scala signatures and invocation

test_description='Scala signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Scala signature syntax test' '../graudit -d ../signatures/scala.db anotherfile'
test_expect_code 1 'Scala context argument' '../graudit -c 5 -d ../signatures/scala.db anotherfile'
test_expect_code 1 'Scala no color test' '../graudit -z -d ../signatures/scala.db anotherfile'
test_expect_code 2 'Scala no such file test' '../graudit -d ../signatures/scala.db nosuchfile'
test_expect_success 'Scala broken rules test' 'test $(../graudit -B -z -d ../signatures/scala.db nomatch.txt | wc -l) -eq 0'
test_done
