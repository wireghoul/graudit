#!/bin/sh
# PHP taint checking with graudit - PoC script
# Written by Wireghoul - http://www.justanotherhacker.com
# Released under the GPL licence
VERSION=0.1
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/check"
    exit 2
fi
graudit -B -z -d php "$1" | \
perl -ne 'if ($_ =~ m/\$([A-Za-z0-9\-\_]+?)\s*=\s*\$_(GET|POST|REQUEST|COOKIE)\[.*?\]/) {
    @rulz=(
      "(include|require)(_once)?[[:space:]]*\\(?", 
      "(exec|system|popen|shell_exec|passtru|eval)[[:space:]]*\\(?",
      "(mysql|mysqli|mssql|pg)_query[[:space:]]*\\(?",
      "(WHERE|where)[[:space:]]+.*=.*",
      "(ORDER[[:space:]]+BY|order[[:space:]]+by)[[:space:]]+.*",
      "(LIMIT|limit)[[:space:]]+.*",
    );
    print "\\\$$1\n" . join("\n", map $_."\\\$$1", @rulz);
}' | \
sort | uniq | \
graudit -B -d /dev/stdin "$1"
