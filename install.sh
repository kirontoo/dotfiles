#!/bin/bash

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
which brew &>/dev/null 
if [[ $? != 0 ]]; then
  echo "homebrew is not installed"
  echo "installing now...."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)" 

  # Moving homebrew to path
  echo "Adding homebrew to your \$PATH"
  if [[ -d /home/linuxbrew/.linuxbrew ]]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    echo "export PATH="\${PATH}:${brew --prefix}"" >>~/.bashrc
  elif [[ -d ~/.linuxbrew ]]; then
    eval $(~/.linuxbrew/bin/brew shellenv)
    echo "export PATH="\${PATH}:${brew --prefix}"" >>~/.bashrc
  fi
else
  echo -e "homebrew already installed. \nUpdating now"
  brew update
  brew upgrade
fi


########### INSTALL ZSH ##########
$(which zsh &>/dev/null)
[[ $? != 0 ]] && {
  echo "no zsh found. installing zsh"   
  brew install zsh
  echo "export PATH"\${PATH}:${brew --prefix}"" >>~/.zshrc
  source ~/.zshrc
  chsh -s $(which zsh)
}

# Install packages
PACKAGES=(
  node
  npm
  rxvt-unicode
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
    brew install $package
    echo "Installing $package"
  }
done

brew clean up
brew install caskroom/cask/brew-cask

CASK_PACKAGES=(
  firefox
  discord
)

for package in ${CASK_PACKAGES[@]}; do
  $(which $package &>/dev/null)
  [[ $? != 0 ]] && {
    brew cask install $package
    echo "Installing $package"
  }
done

# brew tap caskroom/fonts

# Install fonts
FONTS=(
  font-fontawesome
  font-awesome-terminal-fonts
  font-firacode-nerd-font
)

brew install ${FONTS[@]} >/dev/null
brew cleanup

# Create directories
mkdir $HOME/Documents/dev/
