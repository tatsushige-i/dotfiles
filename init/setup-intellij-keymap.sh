#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
KEYMAP_SRC_DIR="$DOTFILES_DIR/intellij/keymaps"
JETBRAINS_DIR="$HOME/Library/Application Support/JetBrains"

if [[ ! -d "$JETBRAINS_DIR" ]]; then
    echo "JetBrains directory not found: $JETBRAINS_DIR (skipping)"
    exit 0
fi

shopt -s nullglob
PRODUCT_DIRS=("$JETBRAINS_DIR"/IdeaIC* "$JETBRAINS_DIR"/IdeaIU*)
shopt -u nullglob

if [[ ${#PRODUCT_DIRS[@]} -eq 0 ]]; then
    echo "No IntelliJ IDEA installation found under $JETBRAINS_DIR (skipping)"
    exit 0
fi

for product_dir in "${PRODUCT_DIRS[@]}"; do
    [[ -d "$product_dir" ]] || continue
    keymaps_dir="$product_dir/keymaps"
    mkdir -p "$keymaps_dir"

    for src in "$KEYMAP_SRC_DIR"/*.xml; do
        [[ -e "$src" ]] || continue
        name="$(basename "$src")"
        dest="$keymaps_dir/$name"

        if [[ -L "$dest" ]]; then
            current_target="$(readlink "$dest")"
            if [[ "$current_target" == "$src" ]]; then
                echo "OK: $dest -> $src"
                continue
            fi
            echo "Re-linking $dest (was -> $current_target)"
            rm "$dest"
        elif [[ -e "$dest" ]]; then
            backup="$dest.bak"
            echo "Backing up existing $dest -> $backup"
            mv "$dest" "$backup"
        fi

        ln -s "$src" "$dest"
        echo "Linked: $dest -> $src"
    done
done

echo "setup-intellij-keymap.sh completed."
