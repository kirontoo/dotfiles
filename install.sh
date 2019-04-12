#!/bin/bash

# TODO: install node and npm
# TODO: install docker, docker compose
# TODO: install rxvt true color

# Install options
while [ -n "$1" ]; do 
  case "$1" in 
    -a) echo "install --all" ;;
    -h) echo "help" ;;
    *) echo "option $1 is not recognized" ;;
  esac
  shift
done


########### HOMEBREW ##########
$(which brew &>/dev/null) 
if [[ $? != 0 ]]; then
  echo "homebrew is not installed"
  echo "installing now...."
  # sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)" 

else
  echo "installed"
  brew update
fi

# test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
# test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile

if [ $(test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)) ]; then
  if [ $(test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)) ]; then
    if [ $(test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile) ]; then
        echo "exists";
    fi
  fi
else
  # TODO: fix this
  # echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile 
  echo "brew not installed in linux.";
fi

########### INSTALL ZSH ##########
# TODO: check in linux where zsh is
$(which zsh &>/dev/null)
[[ $? != 0 ]] && {
  echo "no zsh found. installing zsh"   
  # brew install zsh
}

# Install packages
PACKAGES=(
  node
  npm
  rxvt
  nvim
  docker
  docker-compose
  python3
  git
  wget
)

for package in ${PACKAGES[@]}; do
  $(which $package &>/dev/null)
  [[ $? != 0 ]] && {
    # brew install $package
    echo "\nInstalling $package"
  }
done

# Clean up and install brew cask
# brew clean up
# brew install caskroom/cask/brew-cask

CASK_PACKAGES=(
  firefox
  discord
)

for package in ${CASK_PACKAGES[@]}; do
  $(which $package &>/dev/null)
  [[ $? != 0 ]] && {
    # brew cask install $package
    echo "\nInstalling $package"
  }
done

# brew tap caskroom/fonts

# Install fonts
FONTS=(
  font-fontawesome
  font-awesome-terminal-fonts
  font-firacode-nerd-font
)

# brew install ${FONTS[@]} >/dev/null


# Creat directories
# mkdir $HOME/Documents/dev/
