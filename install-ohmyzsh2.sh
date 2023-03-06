#!/bin/bash

# Install required packages
sudo apt-get update
sudo apt-get install -y zsh curl

# Install Oh My Zsh
curl --silent -L https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | bash

# Change the default shell to zsh
chsh -s $(which zsh)

# Source .zshrc
source ~/.zshrc

echo "Oh My Zsh has been installed successfully!"





echo "List of scripts available:"
echo ""

# Find all .sh files in the current directory and sub-folders
find . -type f -iname "*.sh" | awk '{print NR". "$0}'

# Ask user to select script number to run
echo ""
read -p "Which script would you like to run? (Enter the script number): " selected_script

# Execute the selected script file
selected_script_file=$(find . -type f -iname "*.sh" | sed "${selected_script}q;d")
. $selected_script_file

# Ask user if they want to run another script
echo ""
read -p "Would you like to run another script? (Y/N): " run_another

while [ $run_another == "Y" ] || [ $run_another == "y" ]
do
    echo ""
    # Find all .sh files in the current directory and sub-folders
    find . -type f -iname "*.sh" | awk '{print NR". "$0}'
    
    # Ask user to select script number to run
    echo ""
    read -p "Which script would you like to run? (Enter the script number): " selected_script
    
    # Execute the selected script file
    selected_script_file=$(find . -type f -iname "*.sh" | sed "${selected_script}q;d")
    . $selected_script_file
    
    # Ask user again if they want to run another script
    echo ""
    read -p "Would you like to run another script? (Y/N): " run_another
done 
