#!/bin/bash

export EDITOR='vim'
export VISUAL="$EDITOR"
export TIMEFORMAT='%3lR'
export RIPGREP_CONFIG_PATH=~/.config/rg/rgrc

# By default, SHELL gets set to the user's preferred shell (set via chsh),
# regardless of the shell currently running. I always want new shells to be
# like the currently-running shell unless I specify explicitly.
for shell in bash zsh; do
  case "$0" in
    *$shell)
      case "$SHELL" in
        */$shell) ;;
        *) export SHELL=$(which $shell) ;;
      esac
      ;;
  esac
done

case "$TERM" in
  xterm*)
    if [ -e /usr/share/terminfo/x/xterm-256color ]; then
      export TERM=xterm-256color
    elif [ -e /usr/share/terminfo/x/xterm-color ]; then
      export TERM=xterm-color
    else
      export TERM=xterm
    fi
    ;;
  linux)
    [ -n "$FBTERM" ] && export TERM=fbterm
    ;;
esac
