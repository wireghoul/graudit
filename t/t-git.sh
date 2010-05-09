#!/bin/sh
# Testing git integrity?

# Declare description and number of checks
test_description='Graudit repo tests'
. ./test-lib.sh

# TESTS
test_expect_success 'No outstanding commits' 'git status|grep "working directory clean"'
test_expect_success 'No outstanding push/pulls' 'git status|grep -v "# Your branch is"'
test_done
