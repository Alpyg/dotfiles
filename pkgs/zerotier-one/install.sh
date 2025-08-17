#!/bin/bash
 
install() {
  systemctl enable --now zerotier-one

  # TODO: join network from secret file
}

uninstall() {
  systemctl disable --now zerotier-one
  
  # TODO: leave network from secret file
}
