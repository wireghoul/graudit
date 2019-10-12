#!/bin/sh
#!/bin/sh
# graudit svnhook example by Wireghoul, uses PHP ruleset
REPOSITORY=$1
REVISION=$2
/usr/local/bin/svnlook diff -r $REVISION $REPOSITORY | \
graudit -d php /dev/stdin | \
ansi2html.sh | \
mail -e -s "[graudit report] rev$REVISION - $REPOSITORY" root@domain.com
