#!/bin/sh
# Iterate through testscripts

TOTAL_TESTS=0
TOTAL_PLANNED=0
TOTAL_OK=0
TOTAL_FAIL=0

# Any failed testscript is a make fail
F=0

for TEST in t-*.sh; do
    /bin/sh $TEST $*
    # Allow all tests to run before returning the highest exit code recorded
    T=$?
    if [ $T -ne $F ]; then
        F=$T
        TOTAL_OK=$(($TOTAL_OK + $OK))
    fi
done
rm test-logfile
echo "OK: $TOTAL_OK"
exit $F
