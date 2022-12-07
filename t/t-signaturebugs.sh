#!/bin/sh
# Tests for signature bugs
test_description='Signature bug checks'
. ./test-lib.sh

# Tests
test_expect_code 1 'Blank lines in signature files' 'grep -rE "^$" ../signatures'
test_expect_code 1 'Bad quantifiers in signatures' 'grep -rE "[+*?][+*?]" ../signatures'
test_expect_code 1 'Trailing spaces in signatures' 'grep -rE "[[:space:]]+\$" ../signatures/'
test_done
