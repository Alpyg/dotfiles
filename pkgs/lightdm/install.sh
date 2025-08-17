#!/bin/bash

install() {
	cp /etc/lightdm/lightdm.conf /etc/lightdm/lightdm.conf.bak
	sed -i \
	  -e 's/^#autologin-user=.*/autologin-user=alpyg/' \
	  -e 's/^#autologin-session=.*/autologin-session=bspwm/' \
	  /etc/lightdm/lightdm.conf

	systemctl enable --now lightdm
}

uninstall() {
	rm /etc/lightdm/lightdm.conf
	mv /etc/lightdm/lightdm.conf.bak /etc/lightdm/lightdm.conf

	systemctl disable --now lightdm
}
