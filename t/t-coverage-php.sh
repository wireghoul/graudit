#!/bin/sh
# Testing signature coverage

test_description='PHP signature tests'
. ./test-lib.sh

# Tests
test_expect_code 1 'whitespace test' 'test `../graudit -c 0 -d ../signatures/php.db whitespace.php | wc -l` -eq 2'
test_expect_code 1 'exec test' 'test `../graudit -c 0 -d ../signatures/php.db exec.php | wc -l` -eq 4'
test_done
