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
$(which brew &>/dev/null) 
if [[ $? != 0 ]]; then
  echo "homebrew is not installed"
  echo "installing now...."
  # sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)" 
else
  echo "installed"
fi
