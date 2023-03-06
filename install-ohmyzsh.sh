#!/bin/bash

# Detecft which OS this script is being run on
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  
  # Get the name of the Linux distribution
  distro=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
  
  if [ "$distro" = "\"Ubuntu\"" ]; then
    
    echo "Installing zsh shell..."
    
    # Install zsh shell
    sudo apt-get update
    sudo apt-get install -y zsh
    
    echo "Installing oh-my-zsh..."
    
    # Install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      
    
      
    echo "Changing default shell to zsh..."

    # Change default shell to zsh
    read -p "Time to change your default shell to zsh? (Y/n): " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        chsh -s $(which zsh)
        echo "Your default shell has been changed to zsh. Please logout and login again in order for changes to take effect."
    fi
  
    echo "Sourcing .zshrc to apply changes..."

    # Source .zshrc to apply changes
    source ~/.zshrc

    echo "Installing plugins..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin

    # Install plugins
    plugins=(git zsh-autosuggestions zsh-syntax-highlighting sudo fzf-zsh-plugin colored-man-pages extract wd common-aliases command-not-found)
    plugins_line="plugins=(${plugins[@]})"
    sed -i "s/^plugins=.*/$plugins_line/" ~/.zshrc
    sed -i '1s/^/export FZF_BASE=\/path\/to\/fzf\/install\/dir\n/' ~/.zshrc
    


    echo "Setting random theme..."

    # Set random theme
    sed -i 's/ZSH_THEME=.*/ZSH_THEME="random"/' ~/.zshrc
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

echo "You are awesome!"
