SHELL := /bin/bash

.PHONY: init brew link macos brewsync

init: brew link macos

brew:
	@bash init/brew.sh

link:
	@bash init/link.sh

macos:
	@bash init/macos.sh

brewsync:
	brew bundle dump --file=Brewfile --force
