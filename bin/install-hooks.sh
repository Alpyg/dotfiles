#!/bin/bash

set -e

base_dir="$(realpath "$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)/..")"
hook_dir="/etc/pacman.d/hooks"
sudo rm -rf $hook_dir/*
sudo mkdir -p $hook_dir

declare -A HOOKS=(
  [post_install]="Install|install|PostTransaction|post install hook"
  [post_upgrade]="Upgrade|install|PostTrasaction|post upgrade hook"
  [pre_remove]="Remove|uninstall|PreTransaction|pre remove hook"
)

for hook in "${!HOOKS[@]}"; do
  hook_file="$hook_dir/$hook.hook"

  IFS='|' read -r operation handler when description <<< "${HOOKS[$hook]}"

  echo "Installing $hook_file"
  sudo tee "$hook_file" >/dev/null <<EOF
[Trigger]
Operation = $operation
Type = Package
Target = *

[Action]
Description = $description
When = PostTransaction
Exec = $base_dir/bin/hook.sh $handler
EOF
done

echo "All hooks installed!"
