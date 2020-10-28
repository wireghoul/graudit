#!/bin/sh
# gitlog - A graudit augmentation script
# Written by @Wireghoul - justanotherhacker.com
# Check recent history for some n-day?
# usage: cd repo;gitlog.sh 50

git --no-pager log --oneline | \
grep -Ei '(security|sqli|sql inj|xss| rce |command injection|vulnerability|cmdi| lfi |traversal)' | \
head -$1 | \
cut -d' ' -f1 | \
xargs -n1 git --no-pager show 
