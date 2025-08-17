#!/bin/bash

config_dir="$home/.config/bspwm"

install() {
	install_pkg_config $config_dir
}

uninstall() {
	uninstall_pkg_config $config_dir
}
