#!/bin/sh

#Test should exit with status code 0 or 1 in accordance with POSIX

ok () {
    echo -n "Testing $1 ... "
    $2 2>/dev/null >/dev/null
    if [ $? -le 1 ]; then
        echo "Ok"
    else
        echo "Failed"
    fi
}


not_ok () {
    echo -n "Testing $1 ... "
    $2 2>/dev/null >/dev/null
    if [ $? -lt 2 ]; then
        echo "Failed"
    else
        echo "Ok"
    fi
}
