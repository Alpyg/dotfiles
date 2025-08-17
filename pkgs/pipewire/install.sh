#!/bin/bash
 
install() {
  systemctl --user enable --now pipewire
}

uninstall() {
  systemctl --user disable --now pipewire
}
