#!/bin/bash

# Prompt for username and password
read -p "Enter your Git username: " username
read -s -p "Enter your Git password or personal access token: " password
echo ""

# Clone the repository using the provided credentials
git clone https://${username}:${password}@github.com/rutvik2611/data_config.git
