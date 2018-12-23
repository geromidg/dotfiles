# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Theme
ZSH_THEME=""
DEFAULT_USER=$USER

# Plugins to be loaded
plugins=(git python pip common-aliases sudo)

# Other options
setopt RM_STAR_WAIT
setopt interactivecomments
setopt CORRECT
setopt noincappendhistory
setopt nosharehistory
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

# Prompt
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} %{$fg[cyan]%}%2~%{$reset_color%} $(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"

