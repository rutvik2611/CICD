#!/bin/bash

# curl -s https://raw.githubusercontent.com/rutvik2611/CICD/main/start.sh | bash


echo "Starting installation process..."

echo "Updating apt-get..."
sudo apt-get update 

echo "Installing required packages: curl, git, apt-transport-https, ca-certificates, gnupg-agent, software-properties-common, apache2-utils and filezilla..."
sudo apt-get install -yqq \
        curl \
        git \
        apt-transport-https \
        ca-certificates \
        gnupg-agent \
        software-properties-common \
        apache2-utils \
        filezilla

echo "Adding Docker’s official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "Adding Docker repository for Ubuntu..."
yes "" | sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"

echo "Updating apt-get..."
sudo apt-get update 

echo "Installing Docker CE, Docker CLI and containerd.io..."
sudo apt-get install docker-ce docker-ce-cli containerd.io -yqq

echo "Downloading and installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
    sudo chmod +x /usr/local/bin/docker-compose &&
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

echo "Installation process completed successfully!"


echo "Cloning https://github.com/rutvik2611/CICD.git"
git clone https://github.com/rutvik2611/CICD.git

cd CICD

SCRIPTS=(*.sh)

if [ ${#SCRIPTS[@]} -eq 0 ]; then
    echo "No scripts found in this directory."
else
    echo "Found the following scripts:"
    for (( i = 0; i < ${#SCRIPTS[@]}; i++ )); do
        echo "$((i+1)). ${SCRIPTS[$i]}"
    done

    while true; do
        read -p "Which script would you like to run? Enter a number: " choice
        if ! [[ "$choice" =~ ^[0-9]+$ ]] || ((choice < 1 || choice > ${#SCRIPTS[@]})); then
            echo "Invalid choice!"
        else
            echo "Running script: ${SCRIPTS[$((choice-1))]}"
            ./${SCRIPTS[$((choice-1))]}

            read -p "Would you like to run another script? (y/n) " answer
            if [[ "$answer" =~ ^[Yy]$ ]]; then
                continue
            else
                break
            fi
        fi
    done
fi

