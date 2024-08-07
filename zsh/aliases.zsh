alias cls='clear'
# "-p" lets you create a path structure with one command, ex. mkdir -p /a/b/c
alias md='mkdir -v -p'
alias x='exit'

# Add dates to the history
alias history='history -i 1'

# Stolen from Wez :)

which eza 2>&1 >/dev/null
if [[ $? -eq 0 ]]; then
	# Override default oh-my-zsh directories aliases with eza ones
	unalias ls
	unalias lsa
	alias l='eza --group-directories-first'
	alias ls='eza --group-directories-first'
	alias ll='eza --group-directories-first -l'
	alias la='eza --group-directories-first -la'
fi

# If bat is installed, use that instead of cat
# https://github.com/sharkdp/bat
which bat 2>&1 >/dev/null
if [ $? -eq 0 ]; then
	alias cat='bat'
fi

# zmv is awesome.  You can do "mmv *.cc *.cpp" to rename all .cc files to .cpp.
# Type "zmv" for more info.
autoload -U zmv
alias mmv='noglob zmv -W'
alias mcp='noglob zmv -WC'

rg() {
	local rg_cmd=(
		rg
		--type-add 'test:*_test.*' --type-add 'test:test'
		--sort=path # note: this loses parallelism
	)
	if [ -t 1 ]; then
		command "${rg_cmd[@]}" -p "$@" | less -RFXK
	else
		command "${rg_cmd[@]}" "$@"
	fi
}

# `yesno` is useful for experimentally testing conditionals.
# Example: [[ $x = *foo* ]]; yesno
alias yesno='[[ $? -eq 0 ]] && echo yes || echo no'

# As in "Message Less", use it on a free terminal to see the logs as they come.
alias mess='clear ; tail -f /var/log/messages'

# make a backup of a file
bk() {
	cp -a "$1" "${1}_$(date -u '+%FT%T')"
}

setenv() {
	if [ "x$1" = "x" ]; then
		echo "$0: environment variable name required" >&2
	elif [ "x$2" = "x" ]; then
		echo "$0: environment variable value required" >&2
	else
		export $1=$2
	fi
}

unsetenv() {
	if [ "x$1" = "x" ]; then
		echo "$0: environment variable name required" >&2
	else
		unset $1
	fi
}
