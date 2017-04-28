# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Theme
ZSH_THEME="agnoster"
DEFAULT_USER=$USER

# Hyphen-insensitive completion
HYPHEN_INSENSITIVE="true"

# Red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

# Plugins to be loaded
plugins=(git python ruby)

# Other options
export TERM="xterm-256color"
setopt RM_STAR_WAIT
setopt interactivecomments
setopt CORRECT

# Editor
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# Source scripts and files
source $ZSH/oh-my-zsh.sh
source ~/.aliases
if [ -f ~/.local_sources ]; then source ~/.local_sources; fi

# Launch tmux when done and set theme!
if [ "$TMUX" = "" ]; then tmux -2; fi
