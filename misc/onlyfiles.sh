#!/bin/bash
# Scan only specific file types
# usage: ./onlyfiles.sh <db> <files> <location>
# example: ./onlyfiles.sh js *.js,*.ts,*.php /some/dir
OIFS=$IFS
IFS=','
filter="-type f ( "
for inc in $2; do
    if [ -z $incfiles ]; then
        incfiles="-name $inc"
    else
        incfiles="$incfiles -o -name $inc"
    fi
done
filter="$filter $incfiles )"
IFS=$OIFS
find "$3" $filter -exec graudit -d "$1" -B {} \;
