SHELL := /bin/bash

.PHONY: init brew link macos vscode-extensions intellij-keymap check macoscheck vscodecheck intellijcheck brewsync vscodesync

# Setup
init: brew link macos vscode-extensions intellij-keymap

brew:
	@bash init/setup-brew.sh

link:
	@bash init/setup-link.sh

macos:
	@bash init/setup-macos.sh

vscode-extensions:
	@bash init/setup-vscode-extensions.sh

intellij-keymap:
	@bash init/setup-intellij-keymap.sh

# Maintenance - Check
check: macoscheck vscodecheck intellijcheck

macoscheck:
	@bash check/check-macos.sh

vscodecheck:
	@bash check/check-vscode.sh

intellijcheck:
	@bash check/check-intellij.sh

# Maintenance - Sync
brewsync:
	brew bundle dump --file=Brewfile --force

vscodesync:
	@bash sync/sync-vscode.sh
