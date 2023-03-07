#!/bin/bash

# Prompt for username and password
read -p "Enter your Git username: " username
read -s -p "Enter your Git password or personal access token: " password

echo ""

# Set Git credentials
git config --global user.name $username
git config --global user.password $password

# Check if login is successful
response=$(curl --write-out '%{http_code}' --silent --output /dev/null https://api.github.com/user)
if [ "$response" -ne 200 ]; then
  echo "Failed to authenticate to GitHub. Please check your credentials."
  exit 1
fi

# Clone the repository using the provided credentials
git clone https://${username}:${password}@github.com/rutvik2611/data_config.git
echo "Git login successful"
