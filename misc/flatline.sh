#!/bin/bash
graudit -B -x *.js,*.json,*.map,*.sql -d ./flatline.db $1
find $1 -name "*.php" -exec ./taintfind.sh {} \; | xargs -r ./vulntaint.sh
