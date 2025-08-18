# =============================================================================
# ZSH Configuration
# =============================================================================

# Path to your oh-my-zsh installation
export ZSH=~/.oh-my-zsh

# =============================================================================
# Theme and Appearance
# =============================================================================
# Note: Using Starship prompt instead of ZSH themes

# =============================================================================
# Oh-My-Zsh Plugins
# =============================================================================
plugins=(
  git
  macos
  docker
  terraform
  vi-mode
)

# =============================================================================
# Source Oh-My-Zsh
# =============================================================================
source $ZSH/oh-my-zsh.sh

# =============================================================================
# PATH Configuration
# =============================================================================
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# =============================================================================
# AWS Configuration
# =============================================================================
export AWS_SESSION_TTL=12h
export AWS_ASSUME_ROLE_TTL=1h

# =============================================================================
# Kubernetes and Cloud Tools
# =============================================================================
if command -v kubectl >/dev/null; then
  source <(kubectl completion zsh)
  compdef k=kubectl
fi
if command -v terraform >/dev/null; then
  complete -o nospace -C /opt/homebrew/bin/terraform terraform
fi
if command -v vault >/dev/null; then
  complete -o nospace -C /opt/homebrew/bin/vault vault
fi

# =============================================================================
# Aliases
# =============================================================================
# Editor aliases
alias vim=nvim
alias vi=nvim
alias v=nvim

# Kubernetes
alias k='/opt/homebrew/bin/kubectl'

# Python
alias python=python3
alias pip=pip3

# File listing with eza
alias ls='eza --icons --git --group-directories-first'
alias ll='eza --long --git --icons --group-directories-first --header'
alias lt='eza --tree --level=2 --icons --git'

# Tailscale
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# =============================================================================
# Git Aliases
# =============================================================================
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git switch'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'

# Git configuration for dotfiles
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# =============================================================================
# Tool Initializations
# =============================================================================
# FZF
export FZF_DEFAULT_COMMAND='fd'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Starship prompt
command -v starship >/dev/null && eval "$(starship init zsh)"

# 1Password CLI completion
if command -v op >/dev/null; then
  eval "$(op completion zsh)"; compdef _op op
fi

# =============================================================================
# Completions
# =============================================================================
autoload -Uz bashcompinit && bashcompinit
command -v aws_completer >/dev/null && complete -C aws_completer aws

# =============================================================================
# Functions
# =============================================================================
# Kubernetes SSH function
function kssh() {
   ip=$(echo $1 | sed -nE "s|([a-z-])*([0-9]{1,3})[.-]([0-9]{1,3})[.-]([0-9]{1,3})[.-]([0-9]{1,3})(.*)|\2.\3.\4.\5|p")
   echo parsed target ip as $ip
   ssh -i ~/.ssh/kubernetes.pem admin@$ip
}

# =============================================================================
# Environment Variables
# =============================================================================
export BROWSER_PATH="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
export BROWSER="$BROWSER_PATH"
export EDITOR="nvim"
export VISUAL="$EDITOR"

# =============================================================================
# External Tools
# =============================================================================
# Cargo (Rust)
. "$HOME/.cargo/env"
