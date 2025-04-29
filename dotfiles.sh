#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 [i|u]"
  exit 1
fi

install() {
  echo "Installing..."

  stow -v --target=$HOME/.config .config

  echo "Installation complete."
}

uninstall() {
  echo "Uninstalling..."

  stow -v -D --target=$HOME/.config .config

  echo "Uninstallation complete."
}

case "$1" in
i)
  install
  ;;
u)
  uninstall
  ;;
*)
  echo "Invalid argument. Use 'i' for install or 'u' for uninstall."
  exit 1
  ;;
esac
