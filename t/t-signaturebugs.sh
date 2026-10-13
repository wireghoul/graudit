#!/bin/sh
# Tests for signature bugs
test_description='Signature bug checks'
. ./test-lib.sh

# Tests
test_expect_code 1 'Blank lines in signature files' 'grep -rE "^$" ../signatures'
test_expect_code 1 'Bad character classes' 'grep -rE "[^^\\[]\\[:(al(num|pha)|digit|punct|graph|space|blank|lower|upper|cntrl|print|xdigit)" ../signatures'
test_expect_code 1 'Bad quantifiers in signatures' 'grep -rE "[+*?][+*?]" ../signatures'
test_expect_code 1 'Trailing spaces in signatures' 'grep -rE "[[:space:]]+\$" ../signatures/'
test_expect_code 1 'Escaped quantifiers in signatures' 'grep -rE "\]\\[\*\+\?]" ../signatures'
test_expect_code 1 'Needlessly escaped quotation' 'grep -rE "\\\\'\''\"" ../signatures'
test_expect_code 1 'PCRE whitespace character classes in use' 'grep -rE "\\\\[stW]" ../signatures'
test_done
