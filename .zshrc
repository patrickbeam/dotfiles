# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export FZF_DEFAULT_COMMAND='fd'
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
#export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

#AWS Config 
export AWS_SESSION_TTL=12h
export AWS_ASSUME_ROLE_TTL=1h


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
#source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
PROMPT='p=>'
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bundler
  dotenv
  macos
  docker
  golang
  kops
  terraform
  vi-mode
  nix-zsh-completions
)
source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)

# User configuration

#tailscale alias
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"


alias vim=nvim
alias vi=nvim
alias v=nvim
alias k='/opt/homebrew/bin/kubectl'
alias python=python3
alias pip=pip3
alias ls='lsd'
alias ll='ls -l'
alias lt='ls --tree'

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
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


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X bashcompinit && bashcompinit
autoload bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault
complete -C aws_completer aws

# Functions Jay G magic!
function kssh() {
   ip=$(echo $1 | sed -nE "s|([a-z-])*([0-9]{1,3})[.-]([0-9]{1,3})[.-]([0-9]{1,3})[.-]([0-9]{1,3})(.*)|\2.\3.\4.\5|p")
   echo parsed target ip as $ip
   ssh -i ~/.ssh/kubernetes.pem admin@$ip
}

complete -o nospace -C /opt/homebrew/bin/terraform terraform
export PATH="/usr/local/opt/node@12/bin:$PATH"
eval "$(starship init zsh)"
# 1password cli completion
eval "$(op completion zsh)"; compdef _op op

export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

# The next line enables shell command completion for gcloud.
if [ -f '/Users/patrickbeam/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/patrickbeam/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
git_path=$(which git)
export GIT_COMMAND="$git_path"
alias config='$GIT_COMMAND --git-dir=$HOME/.cfg/ --work-tree=$HOME'
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix
. "$HOME/.cargo/env"
