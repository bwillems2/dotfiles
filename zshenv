# zshenv

# Ensure path only contains unique entries
typeset -U PATH

HOSTNAME=$(hostname -s)

# Set some sane LESS defaults
# -X Disable sending termcap initialization / deinit strings to terminal. Stops clearing on exit
# -F Quit if one screen
# -R Allow raw control characters (colors)
# -W Highlight first unread line after scrolling screen
export LESS='-XFRW'

# add missing sbin path
export PATH="/usr/local/sbin:$PATH"

if [ -r ~/.dotfiles/private/$HOSTNAME.zshenv ] ; then
  source ~/.dotfiles/private/$HOSTNAME.zshenv
fi
