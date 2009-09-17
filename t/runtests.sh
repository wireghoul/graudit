#!/bin/sh
# Iterate through tests

for TEST in t-*.sh; do
    /bin/sh $TEST 
done
