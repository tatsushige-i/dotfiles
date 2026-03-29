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

Full setup (runs brew + link):

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

### Maintenance

Sync current Homebrew packages to Brewfile:

```bash
make brewsync
```

## Structure

```
dotfiles/
├── Makefile
├── Brewfile
├── init/
│   ├── brew.sh        # Homebrew installation and package management
│   ├── link.sh        # Symlink management with stow
│   └── macos.sh       # macOS defaults configuration
├── zsh/
│   ├── .zshrc
│   └── .zprofile
└── git/
    ├── .gitconfig
    └── .gitignore_global
```
