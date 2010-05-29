#!/bin/sh
# Testing invocation and command arguments

test_description="Invocation checks"
. ./test-lib.sh

# Tests
test_expect_success 'version check' '../graudit -v'
test_expect_code 2 'usage check' '../graudit'
test_expect_code 2 'bad argument' '../graudit -99'
test_done
