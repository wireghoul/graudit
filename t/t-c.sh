#!/bin/sh

test_description='C signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_success 'C signature syntax check' '../graudit -d dotnet anotherfile'
test_done
