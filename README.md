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

| Source | Target |
|---|---|
| `zsh/`, `git/` | `$HOME` |
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

### Maintenance - Check

Run all check targets at once:

```bash
make check
```

Check for drift between macos.sh and current macOS settings:

```bash
make macoscheck
```

Check for differences between `vscode/extensions.txt` and locally installed extensions:

```bash
make vscodecheck
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
├── init/
│   ├── brew.sh                      # Homebrew installation and package management
│   ├── link.sh                      # Symlink management with stow
│   ├── macos.sh                     # macOS defaults configuration
│   ├── macos_check.sh               # Check drift between macos.sh and current settings
│   ├── install-vscode-extensions.sh # Install VS Code extensions
│   ├── vscode_check.sh             # Check drift between extensions.txt and local extensions
│   └── vscode_sync.sh              # Sync local extensions to extensions.txt
├── zsh/
│   ├── .zshrc
│   └── .zprofile
├── git/
│   ├── .gitconfig
│   └── .gitignore_global
└── vscode/
    ├── settings.json
    ├── keybindings.json
    ├── mcp.json           # MCP server configuration
    └── extensions.txt
```

## MCP Server Configuration

MCP server configuration is managed in `vscode/mcp.json` (symlinked to `~/Library/Application Support/Code/User/mcp.json` via `make link`).

### Managed Servers

| Server | URL | Auth |
|---|---|---|
| Atlassian Rovo MCP Server | https://mcp.atlassian.com/v1/mcp | OAuth (browser) |

### Authentication

On first setup, sign in to the Atlassian server from the MCP Servers section in the VS Code extensions panel (a browser window will open for Atlassian account authentication).

### Not Managed

`~/Library/Application Support/Code/User/mcp/` (downloaded server binary cache) is not tracked in this repository.
