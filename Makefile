####
# Graudit makefile
###

SIGNATURES := signatures/default.db signatures/php.db signatures/rough.db signatures/perl.db signatures/python.db signatures/asp.db signatures/jsp.db signatures/other.db
DISTFILES := Changelog  graudit  LICENSE  README
VERSION=`./graudit -v | cut -d' ' -f 3`
.PHONY : clean install test

dist: $(DISTFILES) test
	mkdir -p graudit-$(VERSION)/signatures
	cp -f $(DISTFILES) graudit-$(VERSION)
	cp -f $(SIGNATURES) graudit-$(VERSION)/signatures
	tar zcf graudit-$(VERSION).tar.gz graudit-$(VERSION)
	zip -9r graudit-$(VERSION).zip graudit-$(VERSION)
	rm -r graudit-$(VERSION)

install: $(DISTFILES) test
	mkdir -p ~/.graudit
	cp -f $(SIGNATURES) ~/.graudit
	mkdir -p ~/bin
	cp -f graudit ~/bin

clean:
	rm -rf graudit-*.tar.gz graudit-*.zip

test:
	cd t && ./runtests.sh
