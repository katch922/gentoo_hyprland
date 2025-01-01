# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[`.]=* r:|=*'
zstyle ':completion:*' max-errors 2 not-numeric
zstyle ':completion:*' menu select=long
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt '%e'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/katch/.config/zsh/.zshrc'

autoload -Uz compinit colors vcs_info promptinit
compinit
colors
promptinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE="$ZDOTDIR/histfile"
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch
unsetopt autocd beep extendedglob notify
bindkey -e
# End of lines configured by zsh-newuser-install

# User defined options
# Report command running time if it is more than 3 seconds
#REPORTTIME=3
# Add commands to history as they are entered, don't wait for shell to exit
setopt INC_APPEND_HISTORY
# Also remember command start time & duration
#setopt EXTENDED_HISTORY
# Do not keep duplicate commands in history
setopt HIST_IGNORE_ALL_DUPS
# Do not remember commands that start with a whitespace
setopt HIST_IGNORE_SPACE

# prompt restore
# display error colored triangle
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
# set prompt with promptinit
prompt bart

# Set umask for non-login shell
umask 0077

# user-friendly command output
export CLICOLOR=1
ls --color=auto &> /dev/null && alias ls='ls --color=auto'
# set aliases
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
alias ssh-git='eval "$(ssh-agent -s)" && ssh-add $HOME/.local/ssh/id_ed25519'

# add login message
printf "Welcome $USER to $HOST\n"
date
printf "Logged on users:"
w | cut -d " " -f 1 - | grep -v USER | sort -u
uptime

# Activate zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Activate zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Activate zsh-history-substring-search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
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
#if test -z "${XDG_RUNTIME_DIR}"; then
#	export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
#	if ! test -d "${XDG_RUNTIME_DIR}"; then
#		mkdir "${XDG_RUNTIME_DIR}"
#		chmod 0700 "${XDG_RUNTIME_DIR}"
#	fi
#fi
