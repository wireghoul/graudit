#!/bin/sh
# Tests for signature bugs
test_description='Signature bug checks'
. ./test-lib.sh

# Tests
test_expect_code 1 'Blank lines in signature files' 'grep -rE "^$" ../signatures'
test_done
