#!/bin/sh
# Testing invocation and command arguments

. ./harness.sh
ok 'version check' '../graudit -v'
not_ok 'usage check' '../graudit'
not_ok 'bad argument' '../graudit -99'
