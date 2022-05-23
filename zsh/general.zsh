# if we don't set $SHELL then aterm, rxvt,.. will use /bin/sh or /bin/bash :-/
SHELL='/bin/zsh'

#
watch=(notme)                   # watch for everybody but me
LOGCHECK=300                    # check every 5 min for login/logout activity
WATCHFMT='%n %a %l from %m at %t.'

#
# time settings
#

TIMEFMT="
Time spent in user mode   (CPU seconds) : %U
Time spent in kernel mode (CPU seconds) : %S
Total time                              : %E
CPU utilisation (percentage)            : %P
Times the process was swapped           : %W
Times of major page faults              : %F
Times of minor page faults              : %R"

export SHELL LOGCHECK WATCHFMT TIMEFMT

setopt RM_STAR_SILENT
setopt BSD_ECHO
setopt NUMERIC_GLOB_SORT
setopt extended_history		# Puts timestamps in the history
setopt append_history		# history is appended instead of overwriting
setopt share_history		# history is shared across all sessions
setopt histignorealldups	# If  a  new  command  line being added to the history
                            # list duplicates an older one, the older command is removed from the list
setopt histignorespace      # remove command lines from the history list when
                            # the first character on the line is a space
setopt nobeep               # avoid "beep"ing
setopt pushd_ignore_dups    # don't push the same dir twice.

unsetopt BG_NICE
