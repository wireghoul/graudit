#!/bin/sh
# Testing git integrity?

# Declare description and number of checks
test_description='graudit repo tests'
. ./test-lib.sh

# TESTS
test_expect_success 'No outstanding commits' 'git status|grep "working tree clean"'
test_expect_code 1 'No outstanding push/pulls' 'git status|grep "# Your branch is"'
test_done
