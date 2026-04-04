SHELL := /bin/bash

.PHONY: init brew link macos vscode-extensions check macoscheck vscodecheck brewsync vscodesync

# Setup
init: brew link macos vscode-extensions

brew:
	@bash init/brew.sh

link:
	@bash init/link.sh

macos:
	@bash init/macos.sh

vscode-extensions:
	@bash init/install-vscode-extensions.sh

# Maintenance - Check
check: macoscheck vscodecheck

macoscheck:
	@bash init/macos_check.sh

vscodecheck:
	@bash init/vscode_check.sh

# Maintenance - Sync
brewsync:
	brew bundle dump --file=Brewfile --force

vscodesync:
	@bash init/vscode_sync.sh
