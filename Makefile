DESTDIR=
PREFIX=/usr/local

all:

install:
	install -Dm755 get-packt-book.sh $(DESTDIR)$(PREFIX)/bin/get-packt-book.sh
	install -dm755 $(DESTDIR)/usr/lib/systemd/user/
	install -Dm644 packt.service $(DESTDIR)/usr/lib/systemd/user/packt.service
	install -Dm644 packt.timer $(DESTDIR)/usr/lib/systemd/user/packt.timer
