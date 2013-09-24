PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source /home/hrvoje/.rvm/scripts/rvm

[ -s "/home/hrvoje/.scm_breeze/scm_breeze.sh" ] && source "/home/hrvoje/.scm_breeze/scm_breeze.sh"

stty ixany
stty ixoff -ixon
stty stop undef
stty start undef

export EDITOR="vim"
export LFS=/mnt/lfs

source /usr/local/share/chruby/chruby.sh # enable chruby
source ~/.aliases
source ~/.functions

chruby 2.0
