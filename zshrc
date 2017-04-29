# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Theme
ZSH_THEME="agnoster"
DEFAULT_USER=$USER

# Plugins to be loaded
plugins=(git python pip ruby gem common-aliases sudo tmux web-search vagrant)

# Other options
setopt RM_STAR_WAIT
setopt interactivecomments
setopt CORRECT
export ZSH_TMUX_AUTOSTART="true"
TERM="xterm-256color"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

# Editor
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# Catch C-Q and C-S from terminal
stty -ixon

# Source scripts and files
source $ZSH/oh-my-zsh.sh
source ~/.aliases
if [ -f ~/.local_sources ]; then source ~/.local_sources; fi
