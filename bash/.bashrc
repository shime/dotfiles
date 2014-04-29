
# turn off Ctrl + s XOFF (XON is Ctrl + q)
stty ixany
stty ixoff -ixon
stty stop undef
stty start undef

export PATH="$PATH:$HOME/bin"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"

source ~/chruby-0.3.8/share/chruby/chruby.sh
source ~/.aliases
source ~/.functions
source ~/.secrets
source ~/.opinions
source ~/.sexy_prompt

chruby 2.0
[ -s "/home/hrvoje/.scm_breeze/scm_breeze.sh" ] && source "/home/hrvoje/.scm_breeze/scm_breeze.sh"
