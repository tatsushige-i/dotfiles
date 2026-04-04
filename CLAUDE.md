# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

macOS dotfiles repository. Manages Homebrew, Git, Zsh, and VS Code configurations. Run `make init` to reproduce the environment on a new machine.

## Architecture

### Symlink structure (stow)

`init/link.sh` uses GNU stow to create symlinks. See [README.md](README.md#make) for the symlink mapping.

### Claude Code Skills

Files under `.claude/skills/` are symlinks to `~/projects/shared-claude-code/skills/`, shared across multiple repositories.
