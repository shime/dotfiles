# turn off Ctrl + s XOFF (XON is Ctrl + q)
stty ixany
stty ixoff -ixon
stty stop undef
stty start undef

export PATH="$PATH:$HOME/bin"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.1.0/bin:$PATH"
export PATH="$HOME/.node/bin:$PATH"
export PATH=$HOME/local/bin:$PATH
export PATH=./node_modules/.bin:$PATH

source ~/chruby-0.3.9/share/chruby/chruby.sh

if hash chruby 2>/dev/null;then
  chruby 2.2
fi

source ~/chruby-0.3.9/share/chruby/auto.sh

source ~/.aliases
source ~/.functions
if [ -f ~/.secrets ]; then
  source ~/.secrets
fi
source ~/.opinions
source ~/.sexy_prompt

# History related
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=""                   # increase size of history
export HISTFILESIZE=""               #
shopt -s histappend                      # append to history, don't overwrite it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export PYENV_ROOT="${HOME}/.pyenv"

if [ -d "${PYENV_ROOT}" ]; then
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi

export PATH=$HOME/local/bin:$PATH
