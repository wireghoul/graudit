#!/bin/sh
# Testing perl signatures and invocation

test_description='Perl signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Perl signature syntax test' '../graudit -d perl anotherfile'
test_expect_code 1 'Perl context argument' '../graudit -c 5 -d perl anotherfile'
test_expect_code 1 'Perl no color test' '../graudit -z -d perl anotherfile'
test_expect_code 2 'Perl no such file test' '../graudit -d perl nosuchfile'
test_done
