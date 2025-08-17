#!/bin/bash

config_dir="$home/.config/polybar"

install() {
	install_pkg_config $config_dir
}

uninstall() {
	uninstall_pkg_config $config_dir
} 
