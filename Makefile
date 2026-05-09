SHELL := /bin/bash

.PHONY: init brew link macos vscode-extensions intellij-keymap check macoscheck vscodecheck intellijcheck brewsync vscodesync

# Setup
init: brew link macos vscode-extensions intellij-keymap

brew:
	@bash init/brew.sh

link:
	@bash init/link.sh

macos:
	@bash init/macos.sh

vscode-extensions:
	@bash init/install-vscode-extensions.sh

intellij-keymap:
	@bash init/install-intellij-keymap.sh

# Maintenance - Check
check: macoscheck vscodecheck intellijcheck

macoscheck:
	@bash init/macos_check.sh

vscodecheck:
	@bash init/vscode_check.sh

intellijcheck:
	@bash init/intellij_check.sh

# Maintenance - Sync
brewsync:
	brew bundle dump --file=Brewfile --force

vscodesync:
	@bash init/vscode_sync.sh
