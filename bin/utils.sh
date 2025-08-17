#!/bin/bash

install_pkg_config() {
  echo "[${pkg}] Installing config"

  ln -sf $pkg_dir $home/.config
}

uninstall_pkg_config() {
  echo "[${pkg}] Uninstalling config"

  rm -rf $home/.config/$pkg
}
