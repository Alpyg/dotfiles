#!/bin/bash

set -euo pipefail


base_dir="$(realpath "$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)/..")"
user="${SUDO_USER:-$(logname 2>/dev/null || whoami)}"
home="$(eval echo "~$user")"

phase="$1"


source "$base_dir/bin/utils.sh"

mapfile -t pkgs < <(
  tac /var/log/pacman.log |
  awk '
    /transaction completed/ {in_tx=1; next}
    /transaction started/ && in_tx {exit}
    in_tx && /installed|reinstalled|upgraded|removed/ {print $(NF-1)}
  ' |
  tac
)

find_pkg_dir() {
  local name="$1"
  local match
  match=$(find "$base_dir/pkgs" -maxdepth 1 -type d -printf "%f\n" | \
    grep -i "^${name}$" || true)

  if [[ -n "$match" ]]; then
    echo "$base_dir/pkgs/$match"
  else
    echo ""
  fi
}

for pkg in "${pkgs[@]}"; do
  pkg_dir="$(find_pkg_dir "$pkg")"
  script="${pkg_dir}/install.sh"
  if [[ -f "$script" ]]; then
    source "$script"
    if declare -F "$phase" >/dev/null; then
      echo "[$pkg] Running $phase"
      "$phase"
    fi
  elif [[ -d "$pkg_dir" ]]; then
    "${phase}_pkg_config"
  fi
done
