#!/bin/sh
# Testing DotNet signatures and invocation

test_description='DotNet signature database tests'
. ./test-lib.sh

# Test setup
# Nothing to setup

# Tests
test_expect_code 1 'DotNet signature syntax test' '../graudit -d ../signatures/dotnet.db anotherfile'
test_expect_code 1 'DotNet context argument' '../graudit -c 5 -d ../signatures/dotnet.db anotherfile'
test_expect_code 1 'DotNet no color test' '../graudit -z -d ../signatures/dotnet.db anotherfile'
test_expect_code 2 'DotNet no such file test' '../graudit -d ../signatures/dotnet.db nosuchfile'
test_expect_success 'DotNet broken rules test' 'test $(../graudit -B -z -d ../signatures/dotnet.db nomatch.txt | wc -l) -eq 0'
test_done
