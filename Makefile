SHELL := /bin/bash

.PHONY: init brew link brewsync

init: brew link

brew:
	@bash init/brew.sh

link:
	@bash init/link.sh

brewsync:
	brew bundle dump --file=Brewfile --force
