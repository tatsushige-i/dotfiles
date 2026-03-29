SHELL := /bin/bash

.PHONY: init brew link macos vscode-extensions brewsync macoscheck

init: brew link macos vscode-extensions

brew:
	@bash init/brew.sh

link:
	@bash init/link.sh

macos:
	@bash init/macos.sh

vscode-extensions:
	@bash init/install-vscode-extensions.sh

brewsync:
	brew bundle dump --file=Brewfile --force

macoscheck:
	@bash init/macos_check.sh
