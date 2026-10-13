#!/bin/sh
echo "Linting $1 graudit rules"
echo "---------------------------"

echo 'Blank lines in signature files'
grep --colour=always -rE "^$" "$1"

echo 'Bad character classes'
grep --colour=always -rE "[^^\\[]\\[:(al(num|pha)|digit|punct|graph|space|blank|lower|upper|cntrl|print|xdigit)" "$1"

echo 'Bad quantifiers in signatures'
grep --colour=always -rE "[+*?][+*?]" "$1"

echo 'Trailing spaces in signatures'
grep --colour=always -rE "[[:space:]]+\$" "$1"

echo 'Escaped quantifiers in signatures'
grep --colour=always -rE "\]\\[\*\+\?]" "$1"

echo 'Needlessly escaped quotation'
grep --colour=always -rE "\\\\'\''\"" "$1"

echo 'PCRE whitespace character classes in use'
grep --colour=always -rE "\\\\[stW]" "$1"
