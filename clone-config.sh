#!/bin/bash

# Prompt for username and password
export username=rutvik2611
read -s -p "Enter your Git password or personal access token: " password

echo ""

# Set Git credentials
git config --global user.name $username
git config --global user.password $password

# Check if login is successful
# response=$(curl --write-out '%{http_code}' --silent --output /dev/null https://api.github.com/user)
# if [ "$response" -ne 200 ]; then
#   echo "Failed to authenticate to GitHub. Please check your credentials."
#   exit 1
# fi

cd $HOME && git clone https://rutvik2611:${password}@github.com/rutvik2611/data_config.git
echo "Git login successful"
