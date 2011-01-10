#!/bin/sh
# Testing description

test_description='Example test file'
. ./test-lib.sh

# Tests
test_expect_code 1 'working command' '../graudit something'
test_expect_code 2 'bad command' './graudit something'
test_done
