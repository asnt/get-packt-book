DESTDIR=
PREFIX=/usr/local

all:

install:
	install -Dm755 get-packt-book.sh $(DESTDIR)$(PREFIX)/bin/get-packt-book.sh
