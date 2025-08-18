#!/bin/bash

install() {
  echo "[${pkg}] Installing config"

  ln -sf $pkg_dir/Vencord $home/.config
}

uninstall() {
  echo "[${pkg}] Uninstalling config"

  rm -rf $home/.config/Vencord
}
