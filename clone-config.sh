#!/bin/bash



# Prompt for username and password
read -p "Enter your Git username: " username
read -s -p "Enter your Git password or personal access token: " password # If you're using token, paste it here.

echo ""

# Set Git credentials
git config --global user.name $username
git config --global user.password $password

# Check if login is successful

# Clone the repository using the provided credentials
git clone https://${username}:${password}@github.com/rutvik2611/data_config.git
echo "Git login successful"


