#!/bin/sh
# Iterate through testscripts

F=0
for TEST in t-*.sh; do
    /bin/sh $TEST $*
    # Allow all tests to run before returning the highest exit code recorded
    T=$?
    if [ $T -ge $F ]; then
        F=$T
    fi
done
exit $F
