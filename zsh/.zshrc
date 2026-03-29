# PATH
export PATH="$HOME/.local/bin:$PATH"

# Dotfiles
DOTFILES_DIR=~/projects/dotfiles

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history

# Completion
autoload -Uz compinit && compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Prompt
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst

zstyle ':vcs_info:git:*' formats '%b'

PROMPT='%F{cyan}%~%f %F{green}${vcs_info_msg_0_:+($vcs_info_msg_0_) }%f%F{yellow}$%f '

# Aliases - General
alias ll='ls -lAF'
alias la='ls -A'
alias ..='cd ..'
alias ...='cd ../..'
alias mkdir='mkdir -p'

# Aliases - Git
alias g='git'
alias gs='git status'
alias gl='git log --oneline --graph'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gb='git branch'
alias gco='git checkout'
alias gsw='git switch'

# Options
setopt auto_cd
setopt correct

# Dotfiles dirty check
_dotfiles_dirty_check() {
    [[ -d "$DOTFILES_DIR" ]] || return
    if [[ -n "$(git -C "$DOTFILES_DIR" status --porcelain 2>/dev/null)" ]]; then
        print -P "%F{yellow}⚠ dotfiles に未コミットの変更があります ($DOTFILES_DIR)%f"
    fi
}
_dotfiles_dirty_check
