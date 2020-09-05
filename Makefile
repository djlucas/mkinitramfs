BOOTDIR=/boot
MANDIR=/usr/share/man
SBINDIR=/usr/sbin
SYSCONFDIR=/etc
DATADIR=/usr/lib/mkinitcpio

all:

#man:
#	chmod 755 help2man
#	./help2man -s 8 -N ./mkinitcpio -i include.h2m -o mkinitcpio.8

#clean_man:
#	rm -f mkinitcpio.8
#	chmod 0644 help2man

install: all install_bin install_data install_conf

install_bin:
	install -vdm755 $(DESTDIR)$(SBINDIR)
	install -vm755 mkinitcpio $(DESTDIR)$(SBINDIR)
	sed \
           -e "s|@BOOTDIR@|$(BOOTDIR)|g" \
           -e "s|@SBINDIR@|$(SBINDIR)|g" \
           -e "s|@SYSCONFDIR@|$(SYSCONFDIR)|g" \
           -e "s|@DATADIR@|$(DATADIR)|g" \
           -i $(DESTDIR)$(SBINDIR)/mkinitcpio


#install_man: man
#	install -vdm755 $(DESTDIR)$(MANDIR)/man8
#	install -vm644 make-ca.8 $(DESTDIR)$(MANDIR)/man8

install_conf:
	install -vdm755 $(DESTDIR)$(SYSCONFDIR)
	install -vm644 mkinitcpio.conf $(DESTDIR)$(SYSCONFDIR)
	sed \
           -e "s|@DATADIR@|$(DATADIR)|g" \
           -e "s|@SYSCONFDIR@|$(SYSCONFDIR)|g" \
           -i $(DESTDIR)$(SYSCONFDIR)/mkinitcpio.conf

install_data:
	install -vdm755 $(DESTDIR)$(DATADIR)/modules
	install -vdm755 $(DESTDIR)$(DATADIR)/init
	install -vm644  modules/* $(DESTDIR)$(DATADIR)/modules/
	install -vm644  init/*    $(DESTDIR)$(DATADIR)/init/

.PHONY: all install

