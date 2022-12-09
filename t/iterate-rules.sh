#!/bin/bash
# Debugging tool for identifying which rules cause what output
# Usage: iteraterules.sh /path/to/rules/file /path/to/code
for x in `seq 0 $(wc -l "$1"|cut -d' ' -f1)`; do 
    echo -n "$1 +$x - "
    head -$x "$1" | tail -1 | graudit -B -d - "$2" | wc -l
done
