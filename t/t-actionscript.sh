#!/bin/sh
# Testing actionscript signatures and invocation

test_description='Actionscript signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Actionscript signature syntax test' '../graudit -d ../signatures/actionscript.db anotherfile'
test_expect_code 1 'Actionscript context argument' '../graudit -c 5 -d ../signatures/actionscript.db anotherfile'
test_expect_code 1 'Actionscript no color test' '../graudit -z -d ../signatures/actionscript.db anotherfile'
test_expect_code 2 'Actionscript no such file test' '../graudit -d ../signatures/actionscript.db nosuchfile'
test_expect_success 'Actionscript broken rules test' 'test $(../graudit -B -z -d ../signatures/actionscript.db nomatch.txt | wc -l) -eq 0'
test_done
