#!/usr/bin/env bash

aliases_dir="$(dirname "$(readlink -f "$0")")"

# Find aliases.
alias_files=()
while IFS='' read -r line; do
    alias_files+=("$line");
done < <(find "$aliases_dir" -type f -name "*_aliases.sh" ! -name "all_aliases.sh")

# Source them.
for alias in "${alias_files[@]}"; do source "$alias"; done