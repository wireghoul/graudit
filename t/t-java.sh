#!/bin/sh
# Testing jsp signatures and invocation

test_description='Java/jsp signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'JSP signature syntax test' '../graudit -d ../signatures/java.db anotherfile'
test_expect_code 1 'JSP context argument' '../graudit -c 5 -d ../signatures/java.db anotherfile'
test_expect_code 1 'JSP no color test' '../graudit -z -d ../signatures/java.db anotherfile'
test_expect_code 2 'JSP no such file test' '../graudit -d ../signatures/java.db nosuchfile'
test_done
