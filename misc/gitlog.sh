#!/bin/bash
# gitlog - A graudit augmentation script
# Written by @Wireghoul - justanotherhacker.com
# Check recent history for some n-day?
# usage: cd repo;gitlog.sh 50

IFS=$'\n' read -r -d '' -a glog < <(git --no-pager log --oneline | \
grep -Ei '(security|sqli|sql inj|xss| rce |command injection|vulnerability|cmdi| lfi |traversal)' | \
head -$1 && printf '\0')
for diff in "${glog[@]}"; do 
  # Below line is useful if feeding gitlog back into graudit
  # printf "Showing: $diff\n======================================================\n" >&2
  echo "show $diff ?"
  read -n1 -s -p $'Press enter to continue...any other key to skip...\n' key
  if [ "$key" = '' ]; then
      git --no-pager show $(echo $diff|cut -d' ' -f1)
  fi
done
