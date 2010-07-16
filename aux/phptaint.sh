#!/bin/sh
# PHP taint checking with graudit - PoC script
# Written by Wireghoul - http://www.justanotherhacker.com
# Released under the GPL licence
VERSION=0.1
graudit -z -d php $1 | \
perl -ne 'if ($_ =~ m/\$(.*?)\s*=\s*\$_(GET|POST|REQUEST|COOKIE)\[.*?\]/) { print "\\\$$1"; }' | \
graudit -d - $1
