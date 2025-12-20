#!/bin/bash

install() {
	rm /etc/sddm.conf.d/autologin.conf
	mkdir /etc/sddm.conf.d
	cat >/etc/sddm.conf.d/autologin.conf <<EOF
[Autologin]
User=$user
Session=Hyprland
EOF

	systemctl enable --now sddm
}

uninstall() {
	rm /etc/sddm.conf.d/autologin.conf

	systemctl disable --now sddm
}
