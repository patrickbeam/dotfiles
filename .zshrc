# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export PATH=$PATH:$HOME/go/bin
#export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

#AWS Config 
export AWS_SESSION_TTL=12h
export AWS_ASSUME_ROLE_TTL=1h

#Tanzu Kubectl setup
export GODEBUG=x509ignoreCN=0

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
#source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
PROMPT='p=>'
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

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
  tmux
  vi-mode
)
source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)

# User configuration

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
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

export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

# The next line enables shell command completion for gcloud.
if [ -f '/Users/patrickbeam/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/patrickbeam/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
alias config='/opt/homebrew/bin/git --git-dir=/Users/patrickbeam/.cfg/ --work-tree=/Users/patrickbeam'
