#!/bin/sh
# Testing perl signatures and invocation

test_description='Perl signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Perl signature syntax test' '../graudit -d ../signatures/perl.db anotherfile'
test_expect_code 1 'Perl context argument' '../graudit -c 5 -d ../signatures/perl.db anotherfile'
test_expect_code 1 'Perl no color test' '../graudit -z -d ../signatures/perl.db anotherfile'
test_expect_code 2 'Perl no such file test' '../graudit -d ../signatures/perl.db nosuchfile'
test_done
