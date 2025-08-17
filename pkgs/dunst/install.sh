#!/bin/bash

config_dir="$home/.config/dunst"

install() {
	install_pkg_config $config_dir
}

uninstall() {
	uninstall_pkg_config $config_dir
}
