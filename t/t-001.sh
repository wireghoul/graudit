#!/bin/sh
#Test invocations

. ./harness.sh

ok 'default db' '../graudit -d default anotherfile'
ok 'other db' '../graudit -d other anotherfile'
ok 'perl db' '../graudit -d perl anotherfile'
ok 'php db' '../graudit -d php anotherfile'
ok 'python db' '../graudit -d python anotherfile'
ok 'rough db' '../graudit -d rough anotherfile'
