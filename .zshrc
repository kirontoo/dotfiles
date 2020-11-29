# If you come from bash you might have to change your $PATH.
export PATH=$HOME/scripts:$HOME/bin:/usr/local/bin:$PATH

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

################################################
#     _    _ _           
#    / \  | (_) __ _ ___ 
#   / _ \ | | |/ _` / __|
#  / ___ \| | | (_| \__ \
# /_/   \_\_|_|\__,_|___/
                       
alias dev="cd ~/Documents/dev"
alias dotfiles="cd ~/Documents/dev/dotfiles"
alias lg="lazygit"
alias config="cd ~/.config/regolith"
alias ide="~/scripts/ide.sh"

# NNN
alias nnn="nnn -R"

# Tmux 
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"

# docker
alias  dockup="sudo docker-compose up -d"
alias  dockdown="sudo docker-compose down"

# pomodoro
alias pomostart="sleep 1500 && zenity --warning --text='Time to take a break!'"
alias pomobreak="sleep 300 && zenity --warning --text'Break Time over!'"

# Close google chrome
alias killg="wmctrl -c chrome"
alias killd="pkill discord"

# source files
alias srcz="source $HOME/.zshrc"
alias srct="source $HOME/.tmux.conf"

alias cp='cp -i'    # confirm before overwriting existing files
alias mv='mv -i'

# generate ASCII art from text
alias ascii='figlet'

################################################

########## filter history completion ###########
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A'  up-line-or-beginning-search    # Arrow up
bindkey '^[OA'  up-line-or-beginning-search
bindkey '^[[B'  down-line-or-beginning-search  # Arrow down
bindkey '^[OB'  down-line-or-beginning-search
################################################

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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

################################################
#  _ __  _ __  _ __
# | '_ \| '_ \| '_ \
# | | | | | | | | | |
# |_| |_|_| |_|_| |_|

export NNN_PLUG='b:bulknew;c:fzcd;i:imgview;j:autojump;p:preview-tui;'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_COLORS='1267'
################################################

################################################
#  _____  _____  _____ 
# |     ||     ||     |
# |   __||__/  ||   __|
# |  |_  |   __||  |_  
# |   _] |  /  ||   _] 
# |  |   |     ||  |   
# |__|   |_____||__|   
                      

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias fcd='fzf_change_directory'
alias ffe='fzf_find_edit'
alias fkill='fzf_kill'
alias fgd='fzf_git_diff'
alias fgadd='fzf_git_add'
alias fgl='fzf_git_log'
alias grl='fzf_git_reflog'

export FZF_DEFAULT_OPTS='
  --height 75% --multi --reverse
  --bind ctrl-f:page-down,ctrl-b:page-up
'
fzf_find_edit() {
    local file=$(
      fzf --query="$1" --no-multi --select-1 --exit-0 \
          --preview 'bat --color=always --line-range :500 {}'
      )
    if [[ -n $file ]]; then
        $EDITOR "$file"
    fi
}

fzf_change_directory() {
    local directory=$(
      fd --type d | \
      fzf --query="$1" --no-multi --select-1 --exit-0 \
          --preview 'tree -C {} | head -100'
      )
    if [[ -n $directory ]]; then
        cd "$directory"
    fi
}


fzf_kill() {
    local pid_col
    if [[ $(uname) = Linux ]]; then
        pid_col=2
    elif [[ $(uname) = Darwin ]]; then
        pid_col=3;
    else
        echo 'Error: unknown platform'
        return
    fi
    local pids=$(
      ps -f -u $USER | sed 1d | fzf --multi | tr -s [:blank:] | cut -d' ' -f"$pid_col"
      )
    if [[ -n $pids ]]; then
        echo "$pids" | xargs kill -9 "$@"
    fi
}

fzf_git_add() {
    local selections=$(
      git status --porcelain | \
      fzf --ansi \
          --preview 'if (git ls-files --error-unmatch {2} &>/dev/null); then
                         git diff --color=always {2}
                     else
                         bat --color=always --line-range :500 {2}
                     fi'
      )
    if [[ -n $selections ]]; then
        git add --verbose $(echo "$selections" | cut -c 4- | tr '\n' ' ')
    fi
}

fzf_git_log() {
    local selections=$(
      git log --color=always "$@" |
        fzf --ansi --no-sort --no-height \
            --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 |
                       xargs -I@ sh -c 'git show --color=always @'"
      )
    if [[ -n $selections ]]; then
        local commits=$(echo "$selections" | sed 's/^[* |]*//' | cut -d' ' -f1 | tr '\n' ' ')
        git show $commits
    fi
}

fzf_git_reflog() {
    local selection=$(
      git reflog --color=always "$@" |
        fzf --no-multi --ansi --no-sort --no-height \
            --preview "git show --color=always {1}"
      )
    if [[ -n $selection ]]; then
        git show $(echo $selection | cut -d' ' -f1)
    fi
}

fzf_git_diff() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview --preview-window=down:80%
}
################################################

eval "$(jump shell zsh)"
