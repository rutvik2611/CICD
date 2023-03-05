#!/bin/bash

# Detect which OS this script is being run on
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  distro=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
  if [ "$distro" = "\"Ubuntu\"" ]; then
    # Install zsh shell
    sudo apt-get update
    sudo apt-get install -y zsh
  
    # Install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  
    # Install plugins
    sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting sudo fzf thefuck autojump colored-man-pages extract wd common-aliases command-not-found)/' ~/.zshrc
  
    # Set random theme
    sed -i 's/ZSH_THEME=.*/ZSH_THEME=random/' ~/.zshrc
    
    # Change default shell to zsh
    read -p "Time to change your default shell to zsh? (Y/n): " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        chsh -s $(which zsh)
        echo "Your default shell has been changed to zsh. Please logout and login again in order for changes to take effect."
    fi
  
    # Source .zshrc to apply changes
    source ~/.zshrc
  else 
    echo "This script is currently not supported on this OS."
    exit 1
  fi
else
  echo "This script is currently only supported on Linux OS."
  exit 1
fi

echo "You are awesome"
