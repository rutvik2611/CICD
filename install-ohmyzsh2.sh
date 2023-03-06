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

# Check if input given is a valid number or not
regex='^[0-9]+$'
if ! [[ $selected_script =~ $regex ]] ; then
   echo "Invalid input! Exiting..." >&2; exit 1
fi

# Execute the selected script file
selected_script_file=$(find . -type f -iname "*.sh" | sed "${selected_script}q;d")

if [[ "$selected_script_file" == "" ]]
then
    echo "Invalid script number. Exiting..."
else
    . $selected_script_file
fi

while true
do
    # Ask user to run another script or exit
    echo ""
    read -p "Enter 'n' to exit or enter the script number to run: " selected_script

    # Exit if user enters 'n'
    if [ "$selected_script" = "n" ]; then
        echo "Exiting..."
        break
    fi
    
    # Check if input given is a valid number or not
    if ! [[ $selected_script =~ $regex ]] ; then
       echo "Invalid input! Please try again."
       continue
    fi

    # Execute the selected script file
    selected_script_file=$(find . -type f -iname "*.sh" | sed "${selected_script}q;d")

    if [[ "$selected_script_file" == "" ]]
    then
        echo "Invalid script number. Please try again."
    else
        . $selected_script_file
    fi
done
