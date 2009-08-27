####
# Graudit makefile
###

SIGNATURES := signatures/default.db  signatures/php.db     signatures/rough.db signatures/perl.db     signatures/python.db
DISTFILES := Changelog  graudit  LICENSE  README $(SIGNATURES)
VERSION=`./graudit -v | cut -d' ' -f 3`
.PHONY : clean

dist: $(DISTFILES)
	mkdir graudit-$(VERSION)
	tar zcf graudit-$(VERSION).tar.gz graudit-$(VERSION)
	zip -9r graudit-$(VERSION).zip graudit-$(VERSION)
	rm -r graudit-$(VERSION)

clean:
	rm -rf graudit-*.tar.gz graudit-*.zip
