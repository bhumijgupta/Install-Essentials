#!/bin/bash

# This script helps in installing the essential installation packages
# for majorly Ubuntu systems
#
# Download using curl: 
#     $ curl -fsSL https://bit.ly/ubuntu-essentials -o essentials.sh
#
# Download using wget:
#     $ wget https://raw.githubusercontent.com/bhumijgupta/Install-Essentials/master/essentials.sh
#
# Running the script:
#     $ bash essentials.sh

APT_GET_DIR=$(which apt-get)
sudo true

# ***************
# Colors 
# ***************
# TODO: Replace with https://stackoverflow.com/a/45122025/10207937
GREEN="\033[0;32m"
RED="\033[0;31m"
GREY="\033[0;37m"
NO_COLOR="\033[0m"

# ***************
# Check Compatibility 
# ***************
printf "\n${GREEN}Checking Compatibility${NO_COLOR}\n"
if [ -z "$APT_GET_DIR" ]; then
    printf "${RED}Compatibility check failed. Cannot find apt-get${NO_COLOR}\n"
    printf "${RED}Exiting${NO_COLOR}\n"
    exit 1
else
    printf "${GREEN}Compatibilty check passed${NO_COLOR}\n"
fi

# ***************
# Ask permissions 
# ***************
read -r -p 'Upgrade existing packages? [Y/n] ' upgrade_packages
upgrade_packages=${upgrade_packages:-Y}

read -r -p 'Install git? [Y/n] ' install_git
install_git=${install_git:-Y}

read -r -p 'Install pip for python 3? [Y/n] ' install_pip3
install_pip3=${install_pip3:-Y}

read -r -p 'Install C/C++ compiler? [Y/n] ' install_gcc
install_gcc=${install_gcc:-Y}

read -r -p 'Install Chrome? [Y/n] ' install_chrome
install_chrome=${install_chrome:-Y}

read -r -p 'Install Spotify? [Y/n] ' install_spotify
install_spotify=${install_spotify:-Y}

read -r -p 'Install VSCode? [Y/n] ' install_code
install_code=${install_code:-Y}

read -r -p 'Install Postman? [Y/n] ' install_postman
install_postman=${install_postman:-Y}

read -r -p 'Install MongoDB? [Y/n] ' install_mongodb
install_mongodb=${install_mongodb:-Y}

read -r -p 'Install NodeJS? [Y/n] ' install_nodejs
install_nodejs=${install_nodejs:-Y}

read -r -p 'Install VLC? [Y/n] ' install_vlc
install_vlc=${install_vlc:-Y}

read -r -p 'Install Terminator? [Y/n] ' install_terminator
install_terminator=${install_terminator:-Y}

read -r -p 'Install Docker? [Y/n] ' install_docker
install_docker=${install_docker:-Y}

read -r -p 'Install Docker Compose? [Y/n] ' install_docker_compose
install_docker_compose=${install_docker_compose:-Y}

printf "\n${GREEN}Updating Package List${NO_COLOR}\n" 
sudo apt update -y

case $upgrade_packages in
    [yY][eE][sS]|[yY])
    printf "\n${GREEN}Upgrading Packages${NO_COLOR}\n"
    sudo apt install git -y
        ;;
    [nN][oO]|[nN])
    printf "\n${GREY} Skipping package updation${NO_COLOR}\n"
       ;;
    *)
 printf "\n${RED}Invalid input...${NO_COLOR}\n"
 exit 1
 ;;
esac

case $install_git in
    [yY][eE][sS]|[yY])
    printf "\n${GREEN}Installing git${NO_COLOR}\n"
    sudo apt install git -y
        ;;
    [nN][oO]|[nN])
    printf "\n${GREY} Skipping git${NO_COLOR}\n"
       ;;
    *)
 printf "\n${RED}Invalid input...${NO_COLOR}\n"
 exit 1
 ;;
esac

case $install_pip3 in
    [yY][eE][sS]|[yY])
    printf "\n${GREEN}Installing pip3${NO_COLOR}\n"
    sudo apt install python3-pip -y
        ;;
    [nN][oO]|[nN])
    printf "\n${GREY} Skipping pip3${NO_COLOR}\n"
       ;;
    *)
 printf "\n${RED}Invalid input...${NO_COLOR}\n"
 exit 1
 ;;
esac

case $install_gcc in
    [yY][eE][sS]|[yY])
    printf "\n${GREEN}Installing C/C++ compiler${NO_COLOR}\n"    
    sudo apt install build-essential manpages-dev -y
        ;;
    [nN][oO]|[nN])
    printf "\n${GREY} Skipping C/C++ compiler${NO_COLOR}\n"
       ;;
    *)
 printf "\n${RED}Invalid input...${NO_COLOR}\n"
 exit 1
 ;;
esac

case $install_chrome in
    [yY][eE][sS]|[yY])
    printf "\n${GREEN}Installing Chrome${NO_COLOR}\n"    
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    printf "\nCleaning up"
    rm google-chrome-stable_current_amd64.deb
        ;;
    [nN][oO]|[nN])
    printf "\n${GREY} Skipping Chrome${NO_COLOR}\n"
       ;;
    *)
 printf "\n${RED}Invalid input...${NO_COLOR}\n"
 exit 1
 ;;
esac

case $install_spotify in
    [yY][eE][sS]|[yY])
    printf "\n${GREEN}Installing Spotify${NO_COLOR}\n"    
    sudo snap install spotify
        ;;
    [nN][oO]|[nN])
    printf "\n${GREY} Skipping Spotify${NO_COLOR}\n"
       ;;
    *)
 printf "\n${RED}Invalid input...${NO_COLOR}\n"
 exit 1
 ;;
esac

case $install_code in
    [yY][eE][sS]|[yY])
    printf "\n${GREEN}Installing VSCode${NO_COLOR}\n"    
    sudo snap install --classic code
    read -r -p $'\nInstall VSCode recommended extensions ? [Y/n] ' input
    input=${input:-Y}
    case $input in
        [yY][eE][sS]|[yY])
        printf "\n${GREEN}Installing extensions${NO_COLOR}\n"    
        code --install-extension christian-kohler.path-intellisense --user-data-dir="~/.vscode-root"
        code --install-extension CoenraadS.bracket-pair-colorizer --user-data-dir="~/.vscode-root"
        code --install-extension esbenp.prettier-vscode --user-data-dir="~/.vscode-root"
            ;;
        [nN][oO]|[nN])
        printf "\n${GREY} Skipping extensions${NO_COLOR}\n"
            ;;
        *)
    printf "\n${RED}Invalid input...${NO_COLOR}\n"
    exit 1
    ;;
    esac    
       ;;
    [nN][oO]|[nN])
    printf "\n${GREY} Skipping VSCode${NO_COLOR}\n"
       ;;
    *)
 printf "\n${RED}Invalid input...${NO_COLOR}\n"
 exit 1
 ;;
esac

case $install_postman in
    [yY][eE][sS]|[yY])
    printf "\n${GREEN}Installing Postman${NO_COLOR}\n"    
    sudo snap install postman
        ;;
    [nN][oO]|[nN])
    printf "\n${GREY} Skipping Postman${NO_COLOR}\n"
       ;;
    *)
 printf "\n${RED}Invalid input...${NO_COLOR}\n"
 exit 1
 ;;
esac

case $install_mongodb in
    [yY][eE][sS]|[yY])
    printf "\n${GREEN}Installing MongoDB${NO_COLOR}\n"    
    sudo apt-get install gnupg -y
    wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
    printf "\ndeb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
    sudo apt-get update
    sudo apt-get install -y mongodb-org
    printf "\nStarting MongoDB"
    sudo service mongod start
        ;;
    [nN][oO]|[nN])
    printf "\n${GREY} Skipping MongoDB${NO_COLOR}\n"
       ;;
    *)
 printf "\n${RED}Invalid input...${NO_COLOR}\n"
 exit 1
 ;;
esac

case $install_nodejs in
    [yY][eE][sS]|[yY])
    printf "\n${GREEN}Installing NodeJS${NO_COLOR}\n"    
    sudo apt install curl -y
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt install nodejs -y
        ;;
    [nN][oO]|[nN])
    printf "\n${GREY} Skipping NodeJS${NO_COLOR}\n"
       ;;
    *)
 printf "\n${RED}Invalid input...${NO_COLOR}\n"
 exit 1
 ;;
esac

case $install_vlc in
    [yY][eE][sS]|[yY])
    printf "\n${GREEN}Installing VLC${NO_COLOR}\n"    
    sudo snap install vlc
        ;;
    [nN][oO]|[nN])
    printf "\n${GREY} Skipping VLC${NO_COLOR}\n"
       ;;
    *)
 printf "\n${RED}Invalid input...${NO_COLOR}\n"
 exit 1
 ;;
esac

case $install_terminator in
    [yY][eE][sS]|[yY])
    printf "\n${GREEN}Installing Terminator${NO_COLOR}\n"    
    sudo apt-get install terminator -y
        ;;
    [nN][oO]|[nN])
    printf "\n${GREY} Skipping Terminator${NO_COLOR}\n"
       ;;
    *)
 printf "\n${RED}Invalid input...${NO_COLOR}\n"
 exit 1
 ;;
esac

case $install_docker in
    [yY][eE][sS]|[yY])
    printf "\n${GREEN}Installing Docker${NO_COLOR}\n"  
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    sudo usermod -aG docker "$USER"
    printf "\n${GREEN}To use Docker as a non-root user, you will have to log out and back in.${NO_COLOR}\n"
    rm get-docker.sh
        ;;
    [nN][oO]|[nN])
    printf "\n${GREY} Skipping Docker${NO_COLOR}\n"
       ;;
    *)
 printf "\n${RED}Invalid input...${NO_COLOR}\n"
 exit 1
 ;;
esac

case $install_docker_compose in
    [yY][eE][sS]|[yY])
    printf "\n${GREEN}Installing Docker Compose${NO_COLOR}\n" 
    # source: https://gist.github.com/wdullaer/f1af16bd7e970389bad3 
    COMPOSE_VERSION=$(git ls-remote https://github.com/docker/compose | grep refs/tags | grep -oE "[0-9]+\.[0-9][0-9]+\.[0-9]+$" | sort --version-sort | tail -n 1)
    sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"
        ;;
    [nN][oO]|[nN])
    printf "\n${GREY} Skipping Docker Compose${NO_COLOR}\n"
        ;;
    *)
 printf "\n${RED}Invalid input...${NO_COLOR}\n"
 exit 1
 ;;
esac

# google-chrome https://www.mongodb.com/download-center/compass?jmp=docs
