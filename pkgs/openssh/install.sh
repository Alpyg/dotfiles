#!/bin/bash
 
install() {
  systemctl enable --now sshd
}

uninstall() {
  systemctl disable --now sshd
}
