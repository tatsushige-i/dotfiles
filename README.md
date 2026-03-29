# dotfiles

Dotfiles repository for macOS.

## Init

```bash
git clone https://github.com/tatsushige-i/dotfiles.git ~/projects/dotfiles
cd ~/projects/dotfiles
make init
```

## Make

### Setup

Full setup (runs brew + link + macos + vscode-extensions):

```bash
make init
```

Install Homebrew and packages from Brewfile:

```bash
make brew
```

Create symlinks with stow:

```bash
make link
```

Apply macOS defaults:

```bash
make macos
```

Install VS Code extensions from `vscode/extensions.txt`:

```bash
make vscode-extensions
```

### Maintenance

Sync current Homebrew packages to Brewfile:

```bash
make brewsync
```

Check for drift between macos.sh and current macOS settings:

```bash
make macoscheck
```

## Structure

```
dotfiles/
├── Makefile
├── Brewfile
├── init/
│   ├── brew.sh                      # Homebrew installation and package management
│   ├── link.sh                      # Symlink management with stow
│   ├── macos.sh                     # macOS defaults configuration
│   ├── macos_check.sh               # Check drift between macos.sh and current settings
│   └── install-vscode-extensions.sh # Install VS Code extensions
├── zsh/
│   ├── .zshrc
│   └── .zprofile
├── git/
│   ├── .gitconfig
│   └── .gitignore_global
└── vscode/
    ├── settings.json
    ├── keybindings.json
    └── extensions.txt
```
