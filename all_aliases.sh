#!/usr/bin/env bash

aliases_dir="$(dirname "$(readlink -f "$0")")"

# Find aliases.
alias_files=()
while IFS='' read -r line; do
    alias_files+=("$line");
done < <(find "$aliases_dir" -type f -name "*_aliases.sh" ! -name "all_aliases.sh")

# Source them.
for alias in "${alias_files[@]}"; do source "$alias"; done

# Register alias help function.
aliases() {
    # local opts="ah"
    # local long_opts="all,help"
    _print_classes() {
        for alias in "${alias_files[@]}"; do
            alias_basename="$(basename "$alias")"
            local alias_class=${alias_basename%%_*}
            echo " '$alias_class'"
        done
    }

    _help() {
        echo "Usage: 'alias <class>', where <class> is one of:"
        _print_classes
    }

    if [[ $# -eq 0 ]]; then
        echo -n "No arguments provided. "
        _help
    elif [[ $# -gt 1 ]]; then
        echo -n "Only one argument should have been provided."
        _help
    else
        local class="$1"
        class_path="$aliases_dir/${class}_aliases.sh"
        if [[ ! -e "$class_path" ]]; then
            echo "Alias class does not exist! Available classes";
            _print_classes
        else
            echo "$class aliases:"
            cat "$class_path"
        fi
    fi
}
