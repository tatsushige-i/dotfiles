#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# Install Homebrew if not present
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install packages from Brewfile
echo "Installing packages from Brewfile..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

echo "brew.sh completed."
