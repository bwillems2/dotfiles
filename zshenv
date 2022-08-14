# zshenv

# Ensure path only contains unique entries
typeset -U PATH

# Ensure FPATH only contains unique entries
typeset -U FPATH

HOSTNAME=$(hostname -s)

export TERM=screen-256color

# Set some sane LESS defaults
# -X Disable sending termcap initialization / deinit strings to terminal. Stops clearing on exit
# -F Quit if one screen
# -R Allow raw control characters (colors)
# -W Highlight first unread line after scrolling screen
export LESS='-XFRW'

# add missing sbin path
export PATH="/usr/local/sbin:$PATH"

# git-grab setup https://github.com/wezm/git-grab
export GRAB_HOME="$HOME/Developer"

# check for home bin dir, if exists add it
if [ -d "$HOME/bin" ] ; then
  export PATH="$HOME/bin:$PATH"
fi

# golang 
if [ -d "$HOME/go" ] ; then
  export GOPATH=$HOME/go
  export GOBIN=$HOME/go/bin
  export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
fi

# rust / cargo
if [ -d "$HOME/.cargo/bin" ] ; then
  export PATH="$PATH:$HOME/.cargo/bin"
fi

# dotfiles stuff
if [ -d "$HOME/.dotfiles" ] ; then
  export DOT_DIR="$HOME/.dotfiles"
fi

if [ -e "$HOME/.zsh/dot/dot.sh" ] ; then
  fpath=($HOME/.zsh/dot $fpath)  # <- for completion
  source $HOME/.zsh/dot/dot.sh
fi

if [ -r ~/.dotfiles/private/$HOSTNAME.zshenv ] ; then
  source ~/.dotfiles/private/$HOSTNAME.zshenv
fi
