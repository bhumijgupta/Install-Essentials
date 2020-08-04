printf "\n\033[0;32mUpdating Package List\033[0m\n" 
sudo apt update -y

read -r -p $'\nUpgrade existing packages? [Y/n] ' input
input=${input:-Y}
case $input in
    [yY][eE][sS]|[yY])
    printf "\n\033[0;32mUpgrading Packages\033[0m\n"
    sudo apt install git -y
        ;;
    [nN][oO]|[nN])
    printf "\n\033[0;37m Skipping package updation\033[0m\n"
       ;;
    *)
 printf "\n\033[0;31mInvalid input...\033[0m\n"
 exit 1
 ;;
esac

read -r -p $'\nInstall git? [Y/n] ' input
input=${input:-Y}
case $input in
    [yY][eE][sS]|[yY])
    printf "\n\033[0;32mInstalling git\033[0m\n"
    sudo apt install git -y
        ;;
    [nN][oO]|[nN])
    printf "\n\033[0;37m Skipping git\033[0m\n"
       ;;
    *)
 printf "\n\033[0;31mInvalid input...\033[0m\n"
 exit 1
 ;;
esac

read -r -p $'\nInstall pip for python 3? [Y/n] ' input
input=${input:-Y}
case $input in
    [yY][eE][sS]|[yY])
    printf "\n\033[0;32mInstalling pip3\033[0m\n"
    sudo apt install python3-pip -y
        ;;
    [nN][oO]|[nN])
    printf "\n\033[0;37m Skipping pip3\033[0m\n"
       ;;
    *)
 printf "\n\033[0;31mInvalid input...\033[0m\n"
 exit 1
 ;;
esac

read -r -p $'\nInstall C/C++ compiler? [Y/n] ' input
input=${input:-Y}
case $input in
    [yY][eE][sS]|[yY])
    printf "\n\033[0;32mInstalling C/C++ compiler\033[0m\n"    
    sudo apt install build-essential manpages-dev -y
        ;;
    [nN][oO]|[nN])
    printf "\n\033[0;37m Skipping C/C++ compiler\033[0m\n"
       ;;
    *)
 printf "\n\033[0;31mInvalid input...\033[0m\n"
 exit 1
 ;;
esac

read -r -p $'\nInstall Chrome? [Y/n] ' input
input=${input:-Y}
case $input in
    [yY][eE][sS]|[yY])
    printf "\n\033[0;32mInstalling Chrome\033[0m\n"    
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    printf "\nCleaning up"
    rm google-chrome-stable_current_amd64.deb
        ;;
    [nN][oO]|[nN])
    printf "\n\033[0;37m Skipping Chrome\033[0m\n"
       ;;
    *)
 printf "\n\033[0;31mInvalid input...\033[0m\n"
 exit 1
 ;;
esac

read -r -p $'\nInstall Spotify? [Y/n] ' input
input=${input:-Y}
case $input in
    [yY][eE][sS]|[yY])
    printf "\n\033[0;32mInstalling Spotify\033[0m\n"    
    sudo snap install spotify
        ;;
    [nN][oO]|[nN])
    printf "\n\033[0;37m Skipping Spotify\033[0m\n"
       ;;
    *)
 printf "\n\033[0;31mInvalid input...\033[0m\n"
 exit 1
 ;;
esac

read -r -p $'\nInstall VSCode? [Y/n] ' input
input=${input:-Y}
case $input in
    [yY][eE][sS]|[yY])
    printf "\n\033[0;32mInstalling VSCode\033[0m\n"    
    sudo snap install --classic code
        ;;
    [nN][oO]|[nN])
    printf "\n\033[0;37m Skipping VSCode\033[0m\n"
       ;;
    *)
 printf "\n\033[0;31mInvalid input...\033[0m\n"
 exit 1
 ;;
esac

read -r -p $'\nInstall Postman? [Y/n] ' input
input=${input:-Y}
case $input in
    [yY][eE][sS]|[yY])
    printf "\n\033[0;32mInstalling Postman\033[0m\n"    
    sudo snap install postman
        ;;
    [nN][oO]|[nN])
    printf "\n\033[0;37m Skipping Postman\033[0m\n"
       ;;
    *)
 printf "\n\033[0;31mInvalid input...\033[0m\n"
 exit 1
 ;;
esac

read -r -p $'\nInstall MongoDB? [Y/n] ' input
input=${input:-Y}
case $input in
    [yY][eE][sS]|[yY])
    printf "\n\033[0;32mInstalling MongoDB\033[0m\n"    
    sudo apt-get install gnupg -y
    wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
    printf "\ndeb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
    sudo apt-get update
    sudo apt-get install -y mongodb-org
    printf "\nStarting MongoDB"
    sudo service mongod start
        ;;
    [nN][oO]|[nN])
    printf "\n\033[0;37m Skipping MongoDB\033[0m\n"
       ;;
    *)
 printf "\n\033[0;31mInvalid input...\033[0m\n"
 exit 1
 ;;
esac

read -r -p $'\nInstall NodeJS? [Y/n] ' input
input=${input:-Y}
case $input in
    [yY][eE][sS]|[yY])
    printf "\n\033[0;32mInstalling NodeJS\033[0m\n"    
    sudo apt install curl -y
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt install nodejs -y
        ;;
    [nN][oO]|[nN])
    printf "\n\033[0;37m Skipping NodeJS\033[0m\n"
       ;;
    *)
 printf "\n\033[0;31mInvalid input...\033[0m\n"
 exit 1
 ;;
esac

read -r -p $'\nInstall VLC? [Y/n] ' input
input=${input:-Y}
case $input in
    [yY][eE][sS]|[yY])
    printf "\n\033[0;32mInstalling VLC\033[0m\n"    
    sudo snap install vlc
        ;;
    [nN][oO]|[nN])
    printf "\n\033[0;37m Skipping VLC\033[0m\n"
       ;;
    *)
 printf "\n\033[0;31mInvalid input...\033[0m\n"
 exit 1
 ;;
esac

read -r -p $'\nInstall Terminator? [Y/n] ' input
input=${input:-Y}
case $input in
    [yY][eE][sS]|[yY])
    printf "\n\033[0;32mInstalling Terminator\033[0m\n"    
    sudo apt-get install terminator -y
        ;;
    [nN][oO]|[nN])
    printf "\n\033[0;37m Skipping Terminator\033[0m\n"
       ;;
    *)
 printf "\n\033[0;31mInvalid input...\033[0m\n"
 exit 1
 ;;
esac

# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04
read -r -p $'\nInstall Docker? [Y/n] ' input
input=${input:-Y}
case $input in
    [yY][eE][sS]|[yY])
    printf "\n\033[0;32mInstalling Docker\033[0m\n"  
    # Get ubuntu version name  
    ubuntu_version=$(lsb_release -a 2>/dev/null| grep Codename | cut -f2 | awk '{print tolower($0)}')
    # Install prequisites
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    # add official gpg key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    # add docker-ce repository based on ubuntu version
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $ubuntu_version stable"
    sudo apt update
    # install docker-ce
    sudo apt install docker-ce -y
        ;;
    [nN][oO]|[nN])
    printf "\n\033[0;37m Skipping Docker\033[0m\n"
       ;;
    *)
 printf "\n\033[0;31mInvalid input...\033[0m\n"
 exit 1
 ;;
esac

# google-chrome https://www.mongodb.com/download-center/compass?jmp=docs
