#!/bin/sh
# Iterate through testscripts

# Any failed testscript is a make fail
F=0

for TEST in t-*.sh; do
    /bin/sh $TEST
    # Allow all tests to run before returning the highest exit code recorded
    T=$?
    if [ $T -ne $F ]; then
        F=$T
    fi
done
rm test-logfile
exit $F
