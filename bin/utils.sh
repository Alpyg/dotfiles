#!/bin/bash

install_pkg_config() {
  local target_dir="$1"

  uninstall_pkg_config $target_dir

  mkdir -p $target_dir

  for file in "$pkg_dir"/*; do
    local base_file=$(basename "$file")
    if [[ "$base_file" != "install.sh" ]]; then
      ln -sf "$file" "$target_dir/$base_file"
    fi
  done

	chown -R "$user:$user" "$target_dir"
}

uninstall_pkg_config() {
  local target_dir="$1"

  rm -rf $target_dir
}
