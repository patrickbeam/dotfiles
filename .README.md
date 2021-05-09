# Dot Files and System Config macos

## Tracking of .files
To track your . files you'll want to create a bare with the following commands. 
```
git init --bare $HOME/.myconf
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config config status.showUntrackedFiles no
config remote add origin git@github.com:patrickbeam/dotfiles.git
```

You should add the alias line to your .zshrc file.

~/.myconf is the directory set as the git bare repository. Any file within your home folder can now be tracked with normal commands like:

Lets quickly add our zsh and nvim configurations
```
config status
config add .zshrc
config add .config/nvim/init.vim
config commit -m "adding zsh and neovim configuration files"
config push origin main
```
