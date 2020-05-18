#!/bin/bash
# By Eldar Marcussen for SEEK 29/04/2020
echo 'Simplistic Java Expression Language Injection detection'
echo '==================================================}*>>>'
echo ' [*] Identifying use of spring eval with variables:'
grep -HrnE '<spr(ing)?:eval.*\$\{' "$1"
echo ' [*] Identifying EL code definitions.'
grep -hroE '<spr(ing)?:(message|theme).*code=[^>]+>' "$1" | sort -u | sed -e"s/.*code=[\"\']//" -e"s/[\'\"].*//" > /tmp/elcList.txt
echo ' [+] Code list saved as /tmp/elcList.txt'
echo ' [*] Shortlisting codes with arguments.'
cat /tmp/elcList.txt | \
perl -ne "chomp();print \"\$_=[^\\\{\\\;\\\}]+\\\{[0-9]+\\\}\n\";" | \
grep -rEf /dev/stdin "$1" | grep -of /tmp/elcList.txt > /tmp/elcShort.txt
echo ' [+] Shortlist saved as /tmp/elShort.txt'
echo ' [*] The following instances of codes are used with arguments:'
grep -Hrnf /tmp/elcShort.txt "$1" | grep --colour=always -E '<spr.*(var=|arguments=).*\$.*\}' | tee /tmp/elcVars.txt
echo ' [*] Identifying variable assignments from request:'
grep -oE '\$\{[^\}]+\}' /tmp/elcVars.txt | perl -ne 'chomp(); print substr($_,2,length($_)-1).".*=.*[Rr]equest\n";'| grep --colour=always -HnrEf /dev/stdin "$1"