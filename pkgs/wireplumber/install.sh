#!/bin/bash
 
install() {
  systemctl --user enable --now wireplumber
}

uninstall() {
  systemctl --user disable --now wireplumber
}
