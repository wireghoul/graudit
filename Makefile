####
# Graudit makefile
###

SIGNATURES := signatures/default.db signatures/php.db signatures/rough.db signatures/perl.db signatures/python.db signatures/asp.db signatures/jsp.db signatures/other.db signatures/c.db signatures/dotnet.db
DISTFILES := Changelog  graudit  LICENSE  README
VERSION=`./graudit -v | cut -d' ' -f 3`
.PHONY : clean install systeminstall test signatures

dist: $(DISTFILES) test signatures
	mkdir -p graudit-$(VERSION)/signatures
	cp -f $(DISTFILES) graudit-$(VERSION)
	cp -f $(SIGNATURES) graudit-$(VERSION)/signatures
	tar zcf graudit-$(VERSION).tar.gz graudit-$(VERSION)
	zip -9r graudit-$(VERSION).zip graudit-$(VERSION)
	cp -rf t/ graudit-$(VERSION)/
	cp Makefile graudit-$(VERSION)
	tar zcf graudit-$(VERSION)_src.tar.gz graudit-$(VERSION)
	rm -r graudit-$(VERSION)

install: $(DISTFILES) test
	mkdir -p ~/.graudit
	cp -f $(SIGNATURES) ~/.graudit
	mkdir -p ~/bin
	cp -f graudit ~/bin

systeminstall: $(DISTFILES) test
	mkdir -p /usr/share/graudit
	cp -f $(SIGNATURES) /usr/share/graudit
	cp -f $(DISTFILES) /usr/share/graudit
	mv /usr/share/graudit/graudit /usr/bin/graudit


clean:
	rm -rf graudit-*.tar.gz graudit-*.zip

test:
	cd t && ./runtests.sh

signatures:
	cat signatures/dotnet/* > signatures/dotnet.db
