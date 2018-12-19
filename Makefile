###
# graudit makefile
###

prefix = /usr
dataroot = $(prefix)/share
datadir = $(dataroot)/graudit
bindir = $(prefix)/bin
SIGNATURES := signatures/default.db signatures/php.db  signatures/perl.db signatures/python.db signatures/asp.db signatures/java.db signatures/strings.db signatures/c.db signatures/dotnet.db signatures/ruby.db signatures/actionscript.db signatures/ios.db signatures/android.db signatures/all.db
DISTFILES := Changelog  graudit  LICENSE  README graudit.1
VERSION=`./graudit -v | cut -d' ' -f 3`
.PHONY : clean install uninstall userinstall test signatures

dist: clean signatures manpages $(DISTFILES) test
	cd t && ./git-test.sh
	mkdir -p graudit-$(VERSION)/signatures
	cp -f $(DISTFILES) graudit-$(VERSION)
	cp -f $(SIGNATURES) graudit-$(VERSION)/signatures
	tar zcf graudit-$(VERSION).tar.gz graudit-$(VERSION)
	zip -9r graudit-$(VERSION).zip graudit-$(VERSION)
	cp -rf t/ graudit-$(VERSION)/
	rm -rf t/test-results/*
	cp graudit.in.1 graudit-$(VERSION)
	cp -r signatures/ graudit-$(VERSION)
	cp -r misc graudit-$(VERSION)
	tar zcf graudit-$(VERSION)_src.tar.gz graudit-$(VERSION)
	rm -r graudit-$(VERSION)

userinstall: $(DISTFILES) test
	mkdir -p ~/.graudit
	cp -f $(SIGNATURES) ~/.graudit
	mkdir -p ~/bin
	cp -f graudit ~/bin

install: manpages $(DISTFILES) test
	mkdir -p $(bindir)
	mkdir -p $(datadir)
	cp -f $(SIGNATURES) $(datadir)
	cp -f $(DISTFILES) $(datadir)
	mv $(datadir)/graudit $(bindir)/graudit

uninstall:
	rm -f $(bindir)/graudit
	rm -rf $(datadir)

clean:
	rm -f graudit-*.tar.gz graudit-*.zip
	rm -f t/test-results/*
	rm -f graudit.1 graudit.7

test: signatures
	mkdir -p t/test-results
	rm -f t/test-results/*
	cd t && /bin/sh ./runtests.sh
	cd t && /bin/sh ./aggregate-results.sh test-results/*

signatures:
	cat signatures/dotnet/*.db > signatures/dotnet.db
	cat signatures/php/*.db > signatures/php.db
	cat signatures/perl/*.db > signatures/perl.db
	cat signatures/python/*.db > signatures/python.db
	cat signatures/java/*.db > signatures/java.db
	cat signatures/asp.db > signatures/all.db
	cat signatures/c.db >> signatures/all.db
	cat signatures/dotnet.db >> signatures/all.db
	cat signatures/default.db >> signatures/all.db
	cat signatures/java.db >> signatures/all.db
	cat signatures/strings.db >> signatures/all.db
	cat signatures/perl.db >> signatures/all.db
	cat signatures/php.db >> signatures/all.db
	cat signatures/python.db >> signatures/all.db
	cat signatures/ruby.db >> signatures/all.db
	cat signatures/*/xss.db > signatures/xss.db
	cat signatures/*/sql.db > signatures/sql.db
	cat signatures/*/exec.db > signatures/exec.db

manpages:
	nroff -Tascii -mandoc <graudit.in.1 >/dev/null
	cp -f graudit.in.1 graudit.1
	nroff -Tascii -mandoc <graudit.in.7 >/dev/null
	cp -f graudit.in.7 graudit.7
