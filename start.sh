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

# echo "Adding Docker’s official GPG key..."
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# echo "Adding Docker repository for Ubuntu..."
# sudo add-apt-repository -y \
#     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#         $(lsb_release -cs) \
#         stable"
#!/bin/bash

# Adding Docker’s official GPG key
echo "Adding Docker’s official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Adding Docker repository for Ubuntu
echo "Adding Docker repository for Ubuntu..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Installing Docker engine
echo "Installing Docker engine..."
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Installing Docker Compose
echo "Installing Docker Compose..."
sudo curl -sL "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose



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



script_dir="/root/CICD"

# List all scripts in the directory and number them
scripts=( $(ls "$script_dir") )
for i in "${!scripts[@]}"; do 
    echo "$i: ${scripts[$i]}"
done

# Ask user which script to run or to end the program
echo -n "Enter the number of the script you want to run (or 'q' to quit): "
read choice

if [[ "$choice" == "q" ]]; then
    echo "Exiting script selection."
else
    # Verify that the user's input is a valid script number
    re='^[0-9]+$'
    if ! [[ $choice =~ $re ]] || [ "$choice" -ge "${#scripts[@]}" ]; then
        echo "Invalid input. Please enter a valid script number."
        exit 1
    fi

    # Run the selected script
    script_path="$script_dir${scripts[$choice]}"
    bash "$script_path"
fi

