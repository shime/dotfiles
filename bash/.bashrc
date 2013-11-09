[ -s "/home/shime/.scm_breeze/scm_breeze.sh" ] && source "/home/shime/.scm_breeze/scm_breeze.sh"

stty ixany
stty ixoff -ixon
stty stop undef
stty start undef

export EDITOR="vim"
export LFS=/mnt/lfs

source /usr/local/share/chruby/chruby.sh # enable chruby
source ~/.aliases
source ~/.functions

RUBIES=(/usr/local/rubies/ruby-2.0.0-p247)
chruby 2.0
