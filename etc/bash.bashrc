# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
# but only if not SUDOing and have SUDO_PS1 set; then assume smart user.
if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
*)
    ;;
esac

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=99999999
HISTSIZE=99999999

# history browsing
# https://ss64.com/bash/bind.html
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
# will be overwritten with color later
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# include git prompt if available
if [ -f ~/.git_prompt ] ; then
    . ~/.git_prompt
else
    git_prompt=
fi
if [ "`id -u`" -eq 0 ]; then
    PS_hash='# '
else
    PS_hash='\$ '
fi

if [ "$color_prompt" = yes ]; then
    if [ "`id -u`" -eq 0 ]; then
    	PS1='${debian_chroot:+($debian_chroot)}\[\033[31m\]\u\[\033[33m\]@\[\033[36m\]\h\[\033[00m\]:\[\033[33m\]\w \[\033[00m\]$git_prompt\[\033[00m\]<$?> \[\033[00;36m\]$(date "+%b %d, %T %Z")\n\[\033[01;35m\]# \[\033[00m\]'
    else
    	PS1='${debian_chroot:+($debian_chroot)}\[\033[32m\]\u\[\033[33m\]@\[\033[36m\]\h\[\033[00m\]:\[\033[33m\]\w \[\033[00m\]$git_prompt\[\033[00m\]<$?> \[\033[00;36m\]$(date "+%b %d, %T %Z")\n\[\033[01;35m\]\$ \[\033[00m\]'
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h: \w\$ '
fi

# enable color support of ls, grep and others
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias ip='ip -c'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# ASAN symbolizer for clang
# http://clang.llvm.org/docs/AddressSanitizer.html#symbolizing-the-reports
if [ -x /usr/bin/llvm-symbolizer ] ; then
    ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer
elif [ -x /usr/bin/llvm-symbolizer-3.5 ] ; then
    ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-3.5
elif [ -x /usr/bin/llvm-symbolizer-3.8 ] ; then
    ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-3.8
fi


export EDITOR="vim"

## aliases

# for fast typing
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias h='history'
alias g='git status'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -Ah'

# for human readable output
alias ls='ls -h --color=auto'
alias df='df -h'
alias du='du -h'


if [ -f ~/.bash_aliases ] ; then
    . ~/.bash_aliases
fi

