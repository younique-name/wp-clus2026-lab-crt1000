#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR="configs"

if [ ! -d "$CONFIG_DIR" ]; then
  echo "Config directory not found: $CONFIG_DIR" >&2
  exit 1
fi

for file in "$CONFIG_DIR"/*.cfg; do
  echo "Validating $file"
  grep -q '^hostname ' "$file" || {
    echo "Missing hostname in $file" >&2
    exit 1
  }
  grep -q '^interface Loopback0' "$file" || {
    echo "Missing Loopback0 in $file" >&2
    exit 1
  }
  grep -q '^router bgp ' "$file" || {
    echo "Missing BGP configuration in $file" >&2
    exit 1
  }
done

echo "All configuration files passed validation."
