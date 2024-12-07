# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
# change prompt color & style
red='\[\e[0;31m\]'
RED='\[\e[1;31m\]'
blue='\[\e[0;34m\]'
BLUE='\[\e[1;34m\]'
cyan='\[\e[0;36m\]'
CYAN='\[\e[1;36m\]'
green='\[\e[0;32m\]'
GREEN='\[\e[1;32m\]'
yellow='\[\e[0;33m\]'
YELLOW='\[\e[1;33m\]'
purple='\[\e[0;35m\]'
PURPLE='\[\e[1;35m\]'
gray='\[\e[1;30m\]'
nc='\[\033[00m\]'

PS1="$YELLOW~$CYAN\u$YELLOW@$red\h$YELLOW:$YELLOW\n\w\n$nc$ "

# Set umask for non-login shell
umask 077

# protect against accidental overwrite
set -o noclobber

# Command-line editing vi like
# set -o vi

# set PATH so it includes user's private script folder if it exists
# if [ -d "$HOME/.local/bin" ]; then
# 	PATH="$HOME/.local/bin:$PATH"
# fi

# My env variables
#export EDITOR=vim
export HISTCONTROL=ignoredups:ignorespace
#CS50=/home/katch/Documents/projects/Coding/CS50 ; export CS50

# Disable bash history
set +o history

# Set a time out for shell
TMOUT=1800

