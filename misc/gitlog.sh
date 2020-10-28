#!/bin/bash
# gitlog - A graudit augmentation script
# Written by @Wireghoul - justanotherhacker.com
# Check recent history for some n-day?
# usage: cd repo;gitlog.sh 50

git --no-pager log --oneline | \
grep -Ei '(security|sqli|sql inj|xss| rce |command injection|vulnerability|cmdi| lfi |traversal)' | \
head -$1| \
while read diff; do 
  # Below line is useful if feeding gitlog back into graudit
  # printf "Showing: $diff\n======================================================\n" >&2
  git --no-pager show $(echo $diff|cut -d' ' -f1)
done
