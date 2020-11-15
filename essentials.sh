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
# Utils 
# ***************
print_colored() {
    COLOR_PREFIX="\033[0;"
    GREEN="32m"
    RED="31m"
    GREY="37m"
    INFO="96m"
    NO_COLOR="\033[0m"
    if [ "$2" == "danger" ]; then
        COLOR="${COLOR_PREFIX}${RED}"
    elif [ "$2" == "success" ]; then
        COLOR="${COLOR_PREFIX}${GREEN}"
    elif [ "$2" == "debug" ]; then
        COLOR="${COLOR_PREFIX}${GREY}"
    elif [ "$2" == "info" ]; then
        COLOR="${COLOR_PREFIX}${INFO}"
    else
        COLOR="${NO_COLOR}"
    fi
    printf "${COLOR}%b${NO_COLOR}\n" "$1"
}

invalid_input(){
    print_colored "Invalid input..." "danger"
}

# ***************
# Check Compatibility 
# ***************
print_colored "Checking Compatibility" ""
if [ -z "$APT_GET_DIR" ]; then
    print_colored "Compatibility check failed. Cannot find apt-get." "danger"
    print_colored "Exiting" "danger"
    exit 1
else
    print_colored "Compatibilty check passed" "success"
fi

# ***************
# Ask permissions 
# ***************
read -r -p $'\nUpgrade existing packages? [Y/n] ' upgrade_packages
upgrade_packages=${upgrade_packages:-Y}

read -r -p $'\nInstall git? [Y/n] ' install_git
install_git=${install_git:-Y}

read -r -p $'\nInstall pip for python 3? [Y/n] ' install_pip3
install_pip3=${install_pip3:-Y}

read -r -p $'\nInstall C/C++ compiler? [Y/n] ' install_gcc
install_gcc=${install_gcc:-Y}

read -r -p $'\nInstall Chrome? [Y/n] ' install_chrome
install_chrome=${install_chrome:-Y}

read -r -p $'\nInstall Spotify? [Y/n] ' install_spotify
install_spotify=${install_spotify:-Y}

read -r -p $'\nInstall VSCode? [Y/n] ' install_code
install_code=${install_code:-Y}

read -r -p $'\nInstall Postman? [Y/n] ' install_postman
install_postman=${install_postman:-Y}

read -r -p $'\nInstall MongoDB? [Y/n] ' install_mongodb
install_mongodb=${install_mongodb:-Y}

read -r -p $'\nInstall NodeJS? [Y/n] ' install_nodejs
install_nodejs=${install_nodejs:-Y}

read -r -p $'\nInstall VLC? [Y/n] ' install_vlc
install_vlc=${install_vlc:-Y}

read -r -p $'\nInstall Terminator? [Y/n] ' install_terminator
install_terminator=${install_terminator:-Y}

read -r -p $'\nInstall Docker? [Y/n] ' install_docker
install_docker=${install_docker:-Y}

read -r -p $'\nInstall Docker Compose? [Y/n] ' install_docker_compose
install_docker_compose=${install_docker_compose:-Y}

print_colored "Updating Package List"  "success"
sudo apt update -y

case $upgrade_packages in
    [yY][eE][sS]|[yY])
    print_colored "Upgrading Packages" "success"
    sudo apt install git -y
        ;;
    [nN][oO]|[nN])
    print_colored "Skipping package updation" "debug"
       ;;
    *)
 invalid_input
 exit 1
 ;;
esac

case $install_git in
    [yY][eE][sS]|[yY])
    print_colored "Installing git" "success"
    sudo apt install git -y
        ;;
    [nN][oO]|[nN])
    print_colored "Skipping git" "debug"
       ;;
    *)
 invalid_input
 exit 1
 ;;
esac

case $install_pip3 in
    [yY][eE][sS]|[yY])
    print_colored "Installing pip3" "success"
    sudo apt install python3-pip -y
        ;;
    [nN][oO]|[nN])
    print_colored "Skipping pip3" "debug"
       ;;
    *)
 invalid_input
 exit 1
 ;;
esac

case $install_gcc in
    [yY][eE][sS]|[yY])
    print_colored "Installing C/C++ compiler" "success"
    sudo apt install build-essential manpages-dev -y
        ;;
    [nN][oO]|[nN])
    print_colored "Skipping C/C++ compiler" "debug"
       ;;
    *)
 invalid_input
 exit 1
 ;;
esac

case $install_chrome in
    [yY][eE][sS]|[yY])
    print_colored "Installing Chrome" "success"
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    print_colored "Cleaning up" "info"
    rm google-chrome-stable_current_amd64.deb
        ;;
    [nN][oO]|[nN])
    print_colored "Skipping Chrome" "debug"
       ;;
    *)
 invalid_input
 exit 1
 ;;
esac

case $install_spotify in
    [yY][eE][sS]|[yY])
    print_colored "Installing Spotify" "success"
    sudo snap install spotify
        ;;
    [nN][oO]|[nN])
    print_colored "Skipping Spotify" "debug"
       ;;
    *)
 invalid_input
 exit 1
 ;;
esac

case $install_code in
    [yY][eE][sS]|[yY])
    print_colored "Installing VSCode" "success"
    sudo snap install --classic code
    read -r -p $'\nInstall VSCode recommended extensions ? [Y/n] ' input
    input=${input:-Y}
    case $input in
        [yY][eE][sS]|[yY])
        print_colored "Installing extensions"     "success"
        code --install-extension christian-kohler.path-intellisense --user-data-dir="~/.vscode-root"
        code --install-extension CoenraadS.bracket-pair-colorizer --user-data-dir="~/.vscode-root"
        code --install-extension esbenp.prettier-vscode --user-data-dir="~/.vscode-root"
            ;;
        [nN][oO]|[nN])
        print_colored "Skipping extensions" "debug"
            ;;
        *)
    invalid_input
    exit 1
    ;;
    esac    
       ;;
    [nN][oO]|[nN])
    print_colored "Skipping VSCode" "debug"
       ;;
    *)
 invalid_input
 exit 1
 ;;
esac

case $install_postman in
    [yY][eE][sS]|[yY])
    print_colored "Installing Postman" "success"
    sudo snap install postman
        ;;
    [nN][oO]|[nN])
    print_colored "Skipping Postman" "debug"
       ;;
    *)
 invalid_input
 exit 1
 ;;
esac

case $install_mongodb in
    [yY][eE][sS]|[yY])
    print_colored "Installing MongoDB" "success"
    sudo apt-get install gnupg -y
    # TODO: find a way to stay at latest version
    wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
    printf "\ndeb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
    sudo apt-get update
    sudo apt-get install -y mongodb-org
    print_colored "Starting MongoDB" "info"
    sudo service mongod start
        ;;
    [nN][oO]|[nN])
    print_colored "Skipping MongoDB" "debug"
       ;;
    *)
 invalid_input
 exit 1
 ;;
esac

case $install_nodejs in
    [yY][eE][sS]|[yY])
    print_colored "Installing NodeJS" "success"
    sudo apt install curl -y
    # TODO: find a way to stay at latest version
    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    sudo apt install nodejs -y
        ;;
    [nN][oO]|[nN])
    print_colored "Skipping NodeJS" "debug"
       ;;
    *)
 invalid_input
 exit 1
 ;;
esac

case $install_vlc in
    [yY][eE][sS]|[yY])
    print_colored "Installing VLC" "success"
    sudo snap install vlc
        ;;
    [nN][oO]|[nN])
    print_colored "Skipping VLC" "debug"
       ;;
    *)
 invalid_input
 exit 1
 ;;
esac

case $install_terminator in
    [yY][eE][sS]|[yY])
    print_colored "Installing Terminator" "success"
    sudo apt-get install terminator -y
        ;;
    [nN][oO]|[nN])
    print_colored "Skipping Terminator" "debug"
       ;;
    *)
 invalid_input
 exit 1
 ;;
esac

case $install_docker in
    [yY][eE][sS]|[yY])
    print_colored "Installing Docker" "success"
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    sudo usermod -aG docker "$USER"
    print_colored "To use Docker as a non-root user, you will have to log out and back in." "success"
    rm get-docker.sh
        ;;
    [nN][oO]|[nN])
    print_colored "Skipping Docker" "debug"
       ;;
    *)
 invalid_input
 exit 1
 ;;
esac

case $install_docker_compose in
    [yY][eE][sS]|[yY])
    print_colored "Installing Docker Compose" "success"
    # source: https://gist.github.com/wdullaer/f1af16bd7e970389bad3 
    COMPOSE_VERSION=$(git ls-remote https://github.com/docker/compose | grep refs/tags | grep -oE "[0-9]+\.[0-9][0-9]+\.[0-9]+$" | sort --version-sort | tail -n 1)
    sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo sh -c "curl -L https://raw.githubusercontent.com/docker/compose/${COMPOSE_VERSION}/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose"
        ;;
    [nN][oO]|[nN])
    print_colored "Skipping Docker Compose" "debug"
        ;;
    *)
 invalid_input
 exit 1
 ;;
esac

# google-chrome https://www.mongodb.com/download-center/compass?jmp=docs
