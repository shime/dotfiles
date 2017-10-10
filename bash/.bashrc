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
export PATH=$HOME/code/hack/depot_tools:$PATH

source /usr/local/opt/chruby/share/chruby/chruby.sh

if hash chruby 2>/dev/null;then
  chruby 2.4.1
fi

source /usr/local/opt/chruby/share/chruby/auto.sh

source ~/.aliases
source ~/.functions
if [ -f ~/.secrets ]; then
  source ~/.secrets
fi
source ~/.sexy_prompt

export PYENV_ROOT="${HOME}/.pyenv"

if [ -d "${PYENV_ROOT}" ]; then
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi

export PATH=$HOME/local/bin:$PATH
export EDITOR=nvim
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

# Prettier `ls` colors
export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

export NVM_DIR="/Users/hrvoje/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion # This adds bash completion to nvm
export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"

# eval "$(hub alias -s)"

# added by travis gem
[ -f /Users/hrvoje/.travis/travis.sh ] && source /Users/hrvoje/.travis/travis.sh

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /Users/hrvoje/.nvm/versions/node/v7.3.0/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.bash ] && . /Users/hrvoje/.nvm/versions/node/v7.3.0/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.bash

export CXX="`which clang++`"
export CC="`which clang`"
export CPP="`which clang` -E"
export LINK="`which clang++`"
export CXX_host="`which clang++`"
export CC_host="`which clang`"
export CPP_host="`which clang` -E"
export LINK_host="`which clang++`"
export GYP_DEFINES="clang=1"
