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
  chruby 2.5.1
fi

source /usr/local/opt/chruby/share/chruby/auto.sh

eval "$(nodenv init -)"
nodenv global 9.4.0

source ~/.aliases
source ~/.functions
if [ -f ~/.secrets ]; then
  source ~/.secrets
fi
source ~/.sexy_prompt

export PATH=$HOME/local/bin:$PATH
export EDITOR=nvim
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

# Prettier `ls` colors
export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

export JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"

eval "$(hub alias -s)"

export CXX="`which clang++`"
export CC="`which clang`"
export CPP="`which clang` -E"
export LINK="`which clang++`"
export CXX_host="`which clang++`"
export CC_host="`which clang`"
export CPP_host="`which clang` -E"
export LINK_host="`which clang++`"
export GYP_DEFINES="clang=1"

export HISTSIZE="INFINITY"
export HISTCONTROL="ignoreboth:erasedups"
