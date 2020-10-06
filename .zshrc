# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="darkblood"
ZSH_THEME="spaceship"

# ZSH CUSTOM SETTINGS
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_CHAR_SUFFIX=" "

alias dev="cd ~/Documents/dev"
alias dotfiles="cd ~/Documents/dev/dotfiles"
alias db="mongod --dbpath /home/griffin/mongodb-data"
alias db_end="sudo mongod --dbpath /home/griffin/mongodb-data --shutdown"
alias emacs="emacs -tty -fn SpaceMono"
alias qmk="cd ~/Documents/dev/qmk"
alias lg="lazygit"
alias config="cd ~/.config/regolith"
alias ide="~/scripts/ide.sh"

# Tmux aliases
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"

# Close google chrome
alias killg="wmctrl -c chrome"

# source files
alias srcz="source $HOME/.zshrc"
alias srct="source $HOME/.tmux.conf"

########## filter history completion ###########
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A'  up-line-or-beginning-search    # Arrow up
bindkey '^[OA'  up-line-or-beginning-search
bindkey '^[[B'  down-line-or-beginning-search  # Arrow down
bindkey '^[OB'  down-line-or-beginning-search
################################################

################ Commands ######################
alias cp='cp -i'    # confirm before overwriting existing files
alias mv='mv -i'

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git 
  web-search 
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# User configuration
# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi


export TERM=xterm-256color

# neofetch

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
