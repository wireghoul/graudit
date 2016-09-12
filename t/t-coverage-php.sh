#!/bin/sh
# Testing signature coverage

test_description='PHP signature tests'
. ./test-lib.sh

# Tests
test_expect_code 0 'whitespace test' 'test `../graudit -c 0 -d ../signatures/php.db whitespace.php | wc -l` -eq 2'
test_expect_code 0 'exec test' 'test `../graudit -z -c 0 -d ../signatures/php.db exec.php | wc -l` -eq 13'
test_done
