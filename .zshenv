# Set env variables for Zsh session
export XDG_CONFIG_HOME="$HOME/.config"
# change .zshrc dir
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# source some paths
# NVM related
[ -z "$NVM_DIR" ] && export NVM_DIR="$XDG_CONFIG_HOME/nvm/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/install-nvm-exec
# other env variables
export EDITOR="vim"
export C_INCLUDE_PATH="/usr/include"
export LIBRARY_PATH="/usr/local/lib"
export XDG_DATA_HOME="$HOME/.local/share"
export projects="$HOME/Black/Documents/Projects"
# Disable less history
export LESSHISTSIZE=0
# rootless docker
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

# Add locations to the PATH
typeset -U path PATH
path=(~/.local/bin $path)
export PATH
