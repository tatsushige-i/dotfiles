#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Materialize Git LFS objects in the working tree before stow runs,
# so binary assets are linked as real files, not 132-byte LFS pointers.
cd "$DOTFILES_DIR"
git lfs install --local
git lfs pull

PACKAGES=(zsh git wezterm starship)

for pkg in "${PACKAGES[@]}"; do
    echo "Linking $pkg..."
    stow -v -d "$DOTFILES_DIR" -t "$HOME" --adopt "$pkg"
done

# VS Code (different target from $HOME)
VSCODE_TARGET="$HOME/Library/Application Support/Code/User"
echo "Linking vscode..."
stow -v -d "$DOTFILES_DIR" -t "$VSCODE_TARGET" --adopt vscode

# Restore repo versions after --adopt (repo contents take precedence)
cd "$DOTFILES_DIR"
git checkout -- .

echo "link.sh completed."
