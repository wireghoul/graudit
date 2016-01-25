#!/bin/sh
echo -ne " __wakeup[[:space:]]*\\(\n __destruct[[:space:]]*\\(\n __autoload[[:space:]]*\\(\n" | \
graudit -d - -- -A 20 $1

