#!/bin/bash

set -euo pipefail

if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <profile> [profile2 ...]>"
  exit 1
fi

base_dir="$(realpath "$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)/..")"

read_profile() {
  local name="$1"
  while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -z "$line" || "$line" =~ ^# ]] && continue

    if [[ "$line" == @* ]]; then
      read_profile "${line#@}"
    else
      echo "$line"
    fi
  done < "$base_dir/profiles/$name"
}

pkgs=()
for profile in "$@"; do
  if [[ ! -f "$base_dir/profiles/$profile" ]]; then
    echo "Profile '$profile' not found" >&2
    exit 1
  fi
  while IFS= read -r pkg; do
    pkgs+=("$pkg")
  done < <(read_profile "$profile")
done

mapfile -t unique_pkgs < <(printf "%s\n" "${pkgs[@]}")

echo "Installing packages: ${unique_pkgs[*]}"
yay -Sy --noconfirm "${unique_pkgs[@]}"
