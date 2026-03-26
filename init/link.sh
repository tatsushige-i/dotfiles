#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

PACKAGES=(zsh git)

for pkg in "${PACKAGES[@]}"; do
    echo "Linking $pkg..."
    stow -v -d "$DOTFILES_DIR" -t "$HOME" --adopt "$pkg"
done

# Restore repo versions after --adopt (repo contents take precedence)
cd "$DOTFILES_DIR"
git checkout -- .

echo "link.sh completed."
