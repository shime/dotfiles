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

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

if hash chruby 2>/dev/null;then
  chruby 2.2
fi


source ~/.aliases
source ~/.functions
if [ -f ~/.secrets ]; then
  source ~/.secrets
fi
source ~/.opinions
source ~/.sexy_prompt

# History related
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

export PYENV_ROOT="${HOME}/.pyenv"

if [ -d "${PYENV_ROOT}" ]; then
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi

export PATH=$HOME/local/bin:$PATH
export EDITOR=nvim
