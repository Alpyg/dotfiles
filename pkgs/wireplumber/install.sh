#!/bin/bash
 
install() {
  echo "[${pkg}] Installing config"

  ln -sf $pkg_dir/config $home/.config
  systemctl --user enable wireplumber
}

uninstall() {
  echo "[${pkg}] Uninstalling config"

  rm -rf $home/.config/wireplumber
  systemctl --user disable wireplumber
}
