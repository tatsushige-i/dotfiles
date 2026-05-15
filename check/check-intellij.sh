#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
KEYMAP_SRC_DIR="$DOTFILES_DIR/intellij/keymaps"
JETBRAINS_DIR="$HOME/Library/Application Support/JetBrains"

echo "=== IntelliJ IDEA keymaps ==="
echo ""

if [[ ! -d "$JETBRAINS_DIR" ]]; then
    echo "JetBrains directory not found: $JETBRAINS_DIR"
    exit 0
fi

shopt -s nullglob
PRODUCT_DIRS=("$JETBRAINS_DIR"/IdeaIC* "$JETBRAINS_DIR"/IdeaIU*)
shopt -u nullglob

if [[ ${#PRODUCT_DIRS[@]} -eq 0 ]]; then
    echo "No IntelliJ IDEA installation found under $JETBRAINS_DIR"
    exit 0
fi

drift_count=0

for product_dir in "${PRODUCT_DIRS[@]}"; do
    [[ -d "$product_dir" ]] || continue
    product_name="$(basename "$product_dir")"
    keymaps_dir="$product_dir/keymaps"

    for src in "$KEYMAP_SRC_DIR"/*.xml; do
        [[ -e "$src" ]] || continue
        name="$(basename "$src")"
        dest="$keymaps_dir/$name"

        if [[ ! -e "$dest" && ! -L "$dest" ]]; then
            echo "MISSING: $product_name/keymaps/$name"
            drift_count=$((drift_count + 1))
            continue
        fi

        if [[ -L "$dest" ]]; then
            current_target="$(readlink "$dest")"
            if [[ "$current_target" == "$src" ]]; then
                echo "OK: $product_name/keymaps/$name"
            else
                echo "DRIFT (symlink target): $product_name/keymaps/$name -> $current_target"
                drift_count=$((drift_count + 1))
            fi
        else
            echo "DRIFT (not a symlink): $product_name/keymaps/$name"
            if ! diff -q "$src" "$dest" >/dev/null 2>&1; then
                echo "  content differs from $src"
            fi
            drift_count=$((drift_count + 1))
        fi
    done
done

echo ""
if [[ $drift_count -eq 0 ]]; then
    echo "No drift detected."
else
    echo "Drift detected: $drift_count item(s). Run 'make intellij-keymap' to reconcile."
    exit 1
fi
