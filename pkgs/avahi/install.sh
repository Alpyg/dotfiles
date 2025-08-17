#!/bin/bash

install() {
  systemctl enable --now avahi-daemon
}

uninstall() {
  systemctl disable --now avahi-daemon
}
