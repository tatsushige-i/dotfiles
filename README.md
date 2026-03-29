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
