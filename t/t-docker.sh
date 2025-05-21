#!/bin/sh
# Testing Docker signatures and invocation

test_description='Docker signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'Docker signature syntax test' '../graudit -d ../signatures/docker.db anotherfile'
test_expect_code 1 'Docker context argument' '../graudit -c 5 -d ../signatures/docker.db anotherfile'
test_expect_code 1 'Docker no color test' '../graudit -z -d ../signatures/docker.db anotherfile'
test_expect_code 2 'Docker no such file test' '../graudit -d ../signatures/docker.db nosuchfile'
test_expect_success 'Docker broken rules test' 'test $(../graudit -B -z -d ../signatures/docker.db nomatch.txt | wc -l) -eq 0'
test_done
