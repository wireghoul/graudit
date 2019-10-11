#!/bin/sh
# Testing invocation and command arguments

test_description="Invocation checks"
. ./test-lib.sh

# Tests
test_expect_code 2 'usage check' '../graudit'
test_expect_code 1 'Banner suppressed' '../graudit -B anotherfile'
test_expect_code 1 'Context argument check' '../graudit -c 3 anotherfile'
test_expect_code 1 'Help text test' '../graudit -h'
test_expect_code 1 'Case insensitive search' '../graudit -i anotherfile'
test_expect_success 'list databases' '../graudit -l'
test_expect_code 1 'Vim lines test' '../graudit -L anotherfile'
test_expect_success 'version check' '../graudit -v'
test_expect_success 'Banner version check' 'test $(../graudit -v | cut -d" " -f 3 | grep -F -f -  ../graudit| wc -l) -eq 2'
test_expect_code 1 'exclude files check' '../graudit -x *.js anotherfile'
test_expect_code 1 'Supress colors check' '../graudit -z anotherfile'
test_expect_code 1 'High contrast color check' '../graudit -Z anotherfile'
test_expect_code 1 'Colour blind support check' '../graudit -b anotherfile'
test_expect_code 2 'bad argument' '../graudit -99'
test_done
