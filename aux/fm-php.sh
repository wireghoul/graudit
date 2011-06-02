#!/bin/sh
# Scrape freshmeats php releases and run graudit on them
# The wget invocation it unsafe, but renaming files is a pain
# Written by wireghoul
GET http://freshmeat.net/tags/php | \
perl -ne 'if ($_ =~ m{href="(/urls/.*)" class="floatright welcome padleft5 download}) { print "http://freshmeat.net/$1\n"; }' | \
xargs -n1 wget --trust-server-name -nc
#Extract files
unzip *.zip
tar zxf *gz
tar zxf *.tar
graudit -d php *
