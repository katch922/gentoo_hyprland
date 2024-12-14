# Lines configured by zsh-newuser-install
HISTFILE="$ZDOTDIR/histfile"
HISTSIZE=500
SAVEHIST=500
setopt autocd notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

# User defined options
autoload -U compinit colors vcs_info
compinit
#zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
colors
# Report command running time if it is more than 3 seconds
REPORTTIME=3
# Add commands to history as they are entered, don't wait for shell to exit
setopt INC_APPEND_HISTORY
# Also remember command start time & duration
#setopt EXTENDED_HISTORY
# Do not keep duplicate commands in history
setopt HIST_IGNORE_ALL_DUPS
# Do not remember commands that start with a whitespace
setopt HIST_IGNORE_SPACE
# Correct spelling of all arguments in the command line
#setopt CORRECT_ALL
DISABLE_CORRECTION="true"
# Enable autocompletion
#zstyle ':completion:*' completer _complete _correct _approximate

zstyle ':vcs_info:*' stagedstr '%F{green}●%f '
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●%f '
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%F{blue}%b%f %u%c"

_setup_ps1() {
  vcs_info
  GLYPH="▲"
  [ "x$KEYMAP" = "xvicmd" ] && GLYPH="▼"
  PS1="%F{yellow}~%f""%F{green}%n%f""%F{yellow}@%f""%F{red}%m%f"$'\n'"%(?.%F{blue}.%F{red})$GLYPH%f %(1j.%F{cyan}[%j]%f .)%F{blue}%~%f%(!.%F{red}#%f .)"$'\n'"%F{white}> %f"
  RPROMPT="$vcs_info_msg_0_"
}
_setup_ps1

# user-friendly command output
export CLICOLOR=1
ls --color=auto &> /dev/null && alias ls='ls --color=auto'

# Set umask for non-login shell
umask 077

# set aliases
alias ls='ls --color=auto'
alias lx='ls -X --color=auto'
alias l='ls -CF --group-directories-first --color=auto'
alias lh='ls -lh --color=auto'
alias la='ls -A --group-directories-first --color=auto'
alias lla='ls -lah --group-directories-first --color=auto'
alias ld='ls -ld --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir -h --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ip='ip -color=auto'
alias df='df -h'
alias rm='rm -I'
alias cp='cp -i'
alias mv='mv -i'
alias dr='dir -h --group-directories-first --color'
alias du='du -h'
alias mkdir='mkdir -p'
alias free='free -h'
alias dd='dd status="progress"'
alias p='pwd ; ls -CF'
alias d='date "+%d %b %Y"'
alias mypass='cat /etc/passwd'
alias joplin-desktop='joplin-desktop --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias ssh-git='eval "$(ssh-agent -s)" && ssh-add $HOME/.ssh/git_key'

# add login message
#clear
printf "Welcome $USER to $HOST\n"
date
printf "Logged on users:"
w | cut -d " " -f 1 - | grep -v USER | sort -u
uptime

# Activate zsh-autosuggestions
source /usr/share/zsh/site-functions/zsh-autosuggestions.zsh

# Activate zsh-autocomplete
# version 24.09.04 from guru is causing major lag
#source /usr/share/zsh/site-functions/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# Extra settings for zsh-autocomplete
# all Tab widgets
#zstyle ':autocomplete:*complete*:*' insert-unambiguous yes
# all history widgets
#zstyle ':autocomplete:*history*:*' insert-unambiguous yes
# ^S
#zstyle ':autocomplete:menu-search:*' insert-unambiguous yes
# Make Enter submit the command line straight from the menu
#bindkey -M menuselect '\r' .accept-line
# Make Tab go straight to the menu & cycle there 
#bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
#bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

# Activate zsh-syntax-highlighting
source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
# Activate zsh-history-substring-search
source /usr/share/zsh/site-functions/zsh-history-substring-search.zsh
# Bind the keys for the above plugin
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bindkeys from /etc/inputrc "sed -n 's/^/bindkey /; s/: / /p' /etc/inputrc"
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
#bindkey # "\e[5~" beginning-of-history
#bindkey # "\e[6~" end-of-history
#bindkey # "\e[5~" history-search-backward
#bindkey # "\e[6~" history-search-forward
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[8~" end-of-line
bindkey "\eOc" forward-word
bindkey "\eOd" backward-word
#bindkey "^[OH" beginning-of-line
#bindkey "^[OF" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

# Set XDG_RUNTIME_DIR variable
#!/bin/bash
if test -z "${XDG_RUNTIME_DIR}"; then
	export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
	if ! test -d "${XDG_RUNTIME_DIR}"; then
		mkdir "${XDG_RUNTIME_DIR}"
		chmod 0700 "${XDG_RUNTIME_DIR}"
	fi
fi

