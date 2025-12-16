#!/bin/bash

install() {
	echo "[${pkg}] Installing config"

	ln -sf $pkg_dir/MangoHud $home/.config
}

uninstall() {
	echo "[${pkg}] Uninstalling config"

	rm -rf $home/.config/MangoHud
}
