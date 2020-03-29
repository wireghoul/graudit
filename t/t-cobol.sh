#!/bin/sh
# Testing COBOL signatures and invocation

test_description='COBOL signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'COBOL signature syntax test' '../graudit -d ../signatures/cobol.db anotherfile'
test_expect_code 1 'COBOL context argument' '../graudit -c 5 -d ../signatures/cobol.db anotherfile'
test_expect_code 1 'COBOL no color test' '../graudit -z -d ../signatures/cobol.db anotherfile'
test_expect_code 2 'COBOL no such file test' '../graudit -d ../signatures/cobol.db nosuchfile'
test_done
