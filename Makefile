BOOTDIR=/boot
MANDIR=/usr/share/man
SBINDIR=/usr/sbin
SYSCONFDIR=/etc
DATADIR=/usr/lib/mkinitrd

all:

#man:
#	chmod 755 help2man
#	./help2man -s 8 -N ./mkinitrd -i include.h2m -o mkinitrd.8

#clean_man:
#	rm -f mkinitrd.8
#	chmod 0644 help2man

install: all install_bin install_data install_conf

install_bin:
	install -vdm755 $(DESTDIR)$(SBINDIR)
	install -vm755 mkinitrd $(DESTDIR)$(SBINDIR)
	sed \
           -e "s|@BOOTDIR@|$(BOOTDIR)|g" \
           -e "s|@SBINDIR@|$(SBINDIR)|g" \
           -e "s|@SYSCONFDIR@|$(SYSCONFDIR)|g" \
           -e "s|@DATADIR@|$(DATADIR)|g" \
           -i $(DESTDIR)$(SBINDIR)/mkinitrd


#install_man: man
#	install -vdm755 $(DESTDIR)$(MANDIR)/man8
#	install -vm644 mkinitrd.8 $(DESTDIR)$(MANDIR)/man8

install_conf:
	install -vdm755 $(DESTDIR)$(SYSCONFDIR)
	install -vm644 mkinitrd.conf $(DESTDIR)$(SYSCONFDIR)
	sed \
           -e "s|@DATADIR@|$(DATADIR)|g" \
           -e "s|@SYSCONFDIR@|$(SYSCONFDIR)|g" \
           -i $(DESTDIR)$(SYSCONFDIR)/mkinitrd.conf

install_data:
	install -vdm755 $(DESTDIR)$(DATADIR)/hooks
	install -vdm755 $(DESTDIR)$(DATADIR)/init
	install -vm644  hooks/* $(DESTDIR)$(DATADIR)/hooks/
	install -vm644  init/*  $(DESTDIR)$(DATADIR)/init/

.PHONY: all install

