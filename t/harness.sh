#!/bin/sh
# Simple shell based test harness

# Default values
PLANNED=0
OK=0
FAIL=0
RET=0
LOG=test-logfile

#Dirty options handling
if [ "$1" = '-v' ]; then
    set -x
fi
if [ "$1" = '-d' ]; then
    set -x
    DEBUG=1
fi

plan () {
    DEC=$1
    PLANNED=$2
}

# Track highest return value
set_ret () {
    if [ $1 -gt $RET ]; then
        RET=$1
    fi
}

#Test should exit with status code 0 or 1 in accordance with POSIX
ok () {
    echo -n "Testing $1 ... "
    $2 >>$LOG 2>&1
    TR=$?
    if [ $TR -le 1 ]; then
        OK=$(($OK+1))
        echo "Ok"
        set_ret 0
    else
        FAIL=$(($FAIL+1))
        echo "Failed"
        set_ret $TR
    fi
}


not_ok () {
    echo -n "Testing $1 ... "
    $2 >>$LOG 2>&1
    TR=$?
    if [ $TR -lt 2 ]; then
        FAIL=$(($FAIL+1))
        echo "Failed"
        # Cannot use value of $? as success is fail in this case
        set_ret 2
    else
        OK=$(($OK+1))
        echo "Ok"
        # Cannot use value of $? as fail is success in this case
        set_ret 0
    fi
}

# Run reports and return highest exit code on exit
die () {
    TOTAL=$(($OK+$FAIL))
    if [ $TOTAL -ne $PLANNED ]; then
        echo >&2 "$0 Wrong number of tests ($TOTAL) expected $PLANNED"
        exit 2
    fi
    echo "$DESC"
    echo "Completed $TOTAL of $PLANNED tests"
    echo "OK: $OK"
    echo "FAIL: $FAIL"
    exit $RET
}

# Don't make reporting and aggregation optional
trap 'die' EXIT
