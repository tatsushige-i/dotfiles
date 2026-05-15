# dotfiles

Dotfiles repository for macOS.

## Init

```bash
git clone https://github.com/tatsushige-i/dotfiles.git ~/projects/dotfiles
cd ~/projects/dotfiles
make init
```

## Make

Make targets are organized into the following categories:

- **Setup**: Apply repository settings to local environment (run all at once with `make init`)
- **Maintenance - Check**: Check for drift between repository and local state (read-only)
- **Maintenance - Sync**: Reflect current local state back into the repository

### Setup

Full setup (runs brew + link + macos + vscode-extensions + intellij-keymap):

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

| Source | Target |
|---|---|
| `zsh/`, `git/`, `wezterm/`, `starship/` | `$HOME` |
| `vscode/` | `~/Library/Application Support/Code/User` |

Uses `--adopt` to incorporate existing files, then restores repo versions with `git checkout -- .`.

Apply macOS defaults:

```bash
make macos
```

Install VS Code extensions from `vscode/extensions.txt`:

```bash
make vscode-extensions
```

Install IntelliJ IDEA keymaps from `intellij/keymaps/` (symlinks into all detected `IdeaIC*` / `IdeaIU*` directories):

```bash
make intellij-keymap
```

### Maintenance - Check

Run all check targets at once:

```bash
make check
```

Check for drift between setup-macos.sh and current macOS settings:

```bash
make macoscheck
```

Check for differences between `vscode/extensions.txt` and locally installed extensions:

```bash
make vscodecheck
```

Check for drift between `intellij/keymaps/` and the installed IntelliJ IDEA keymap symlinks:

```bash
make intellijcheck
```

### Maintenance - Sync

Sync current Homebrew packages to Brewfile:

```bash
make brewsync
```

Sync locally installed VS Code extensions to `vscode/extensions.txt`:

```bash
make vscodesync
```

## Structure

```
dotfiles/
├── Makefile
├── Brewfile
├── init/                             # Setup scripts (環境構築・インストール)
│   ├── setup-brew.sh                 # Homebrew installation and package management
│   ├── setup-link.sh                 # Symlink management with stow
│   ├── setup-macos.sh                # macOS defaults configuration
│   ├── setup-vscode-extensions.sh    # Install VS Code extensions
│   └── setup-intellij-keymap.sh      # Symlink IntelliJ IDEA keymaps into JetBrains config dirs
├── check/                            # Drift check scripts (既存設定と現状との差分確認)
│   ├── check-macos.sh                # Check drift between setup-macos.sh and current settings
│   ├── check-vscode.sh               # Check drift between extensions.txt and local extensions
│   └── check-intellij.sh             # Check drift of IntelliJ IDEA keymap symlinks
├── sync/                             # Sync scripts (ローカル状態をリポジトリへ反映)
│   └── sync-vscode.sh                # Sync local extensions to extensions.txt
├── zsh/
│   ├── .zshrc
│   └── .zprofile
├── git/
│   ├── .gitconfig
│   └── .gitignore_global
├── wezterm/.config/wezterm/
│   ├── wezterm.lua                   # Main configuration
│   ├── background.lua                # Background layers (gradient + image)
│   ├── keybinds.lua                  # Key bindings
│   └── background_night.png          # Background image (Git LFS)
├── starship/.config/
│   └── starship.toml                 # Starship prompt configuration
├── vscode/
│   ├── settings.json
│   ├── keybindings.json
│   ├── mcp.json           # MCP server configuration
│   └── extensions.txt
└── intellij/
    └── keymaps/
        └── macOS.xml                 # IntelliJ IDEA custom keymap
```
