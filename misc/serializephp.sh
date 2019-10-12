#!/bin/sh
(echo -ne " __wakeup[[:space:]]*\\(\n __destruct[[:space:]]*\\(\n __autoload[[:space:]]*\\(\n"; \
# uncomment below if you want everything
# echo -ne " __toString[[:space:]]*\\(\n __call[[:space:]]*\\(\n __Set[[:space:]]*\\(\n __get[[:space:]]*\\(\n" \
) | \
graudit -d /dev/stdin -- -A 20 $1

