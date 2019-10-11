#!/bin/sh
# Ensure changelog version and script versions match

test_description='Version number matching'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_success 'changelog version matches script version' '
head -1 ../Changelog| cut -d" " -f1>ver1
../graudit -v | cut -d" " -f3>ver2
test_cmp ver1 ver2
'

rm ver1
rm ver2

test_done
