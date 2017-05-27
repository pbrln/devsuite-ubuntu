#!/bin/bash
#
# Author: pbrln
# License: MIT

function installAll {
	installGit
    installNode
    installVSCode
    installPython
    installMakeTools
    installBuildEssential
	installZshWithZim
}

function installGit {
    printf "Installing GIT"
    apt-get install -y git > /dev/null
    echo " [DONE]"
}

function installNode {
    #Add Node to source repos
    printf "Adding node repository"
    curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash - > /dev/null
    echo " [DONE]"
    printf "Installing NodeJS"
    apt-get install -y nodejs > /dev/null
    echo " [DONE]"
    
    printf "Adding Yarn repository"
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - > /dev/null
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list > /dev/null
    echo " [DONE]"

    printf "Installing Yarn"
    apt-get update && apt-get install yarn
    echo " [DONE]"
    #printf "Installing NPM"
    #apt-get install -y npm > /dev/null
    #echo " [DONE]"
}

function installVSCode {
    printf "Adding Visual Studio Code repository"
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg > /dev/null
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' > /dev/null
    echo " [DONE]"
    printf "Installing Visual Studio Code"
    apt-get update > /dev/null
    apt-get install code > /dev/null
    echo " [DONE]"
}

function installPython {
    printf "Installing python"
    apt-get install python3 > /dev/null
    echo " [DONE]"
}

function installMakeTools {
    printf "Installing make, cmake, g++"
    apt-get install cmake -y > /dev/null
    apt-get install g++ -y > /dev/null
    echo " [DONE]"
}

function installBuildEssential {
    printf "Installing build-essential"
    apt-get install build-essential > /dev/null
    echo " [DONE]"
}

function installZshWithZim {
    printf "Installing zsh"
	apt-get install zsh -y > /dev/null
	chsh -s /usr/bin/zsh > /dev/null
    echo " [DONE]"
	printf "Installing zim"
    git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim
	source ${ZDOTDIR:-${HOME}}/.zlogin
	echo " [DONE]"
}

function installIndividual {
	installGit
    while true; do
        read -p "Do you wish to install NodeJS? [Y/n] " installYN
        case $installYN in
            [Yy]* ) installGit; break;;
            [Nn]* ) break;;
        esac
    done
    while true; do
        read -p "Do you wish to install Visual Studio Code? [Y/n] " installYN
        case $installYN in
            [Yy]* ) installVSCode; break;;
            [Nn]* ) break;;
        esac
    done
    while true; do
        read -p "Do you wish to install python? [Y/n] " installYN
        case $installYN in
            [Yy]* ) installPython; break;;
            [Nn]* ) break;;
        esac
    done
    while true; do
        read -p "Do you wish to install make, cmake, g++? [Y/n] " installYN
        case $installYN in
            [Yy]* ) installMakeTools; break;;
            [Nn]* ) break;;
        esac
    done
    while true; do
        read -p "Do you wish to install build-essential? [Y/n] " installYN
        case $installYN in
            [Yy]* ) installBuildEssential; break;;
            [Nn]* ) break;;
        esac
    done
    while true; do
        read -p "Do you wish to install zsh with zim? [Y/n] " installYN
        case $installYN in
            [Yy]* ) installZshWithZim; break;;
            [Nn]* ) break;;
        esac
    done
}
printf "\033c"
echo "Ubuntu Development Suite Installer"
echo "The following software and all of it's dependencies will be installed:"
echo "- GIT"
echo "- NodeJS, Yarn"
echo "- Visual Studio Code"
echo "- python"
echo "- make, cmake, g++"
echo "- build-essential"
echo "- zsh with zim"
while true; do
    read -p "Do you wish to install the whole package? Otherwise you'll be asked for each package. [Y/n] " installAll
    case $installAll in
        [Yy]* ) installAll; break;;
        [Nn]* ) installIndividual; break;;
    esac
done
