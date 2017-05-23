#!/bin/bash
#
# Author: pbrln
# License: MIT

function installAll {
    installNode
}

function installNode {
    #Add Node to source repos
    printf "Adding node repository"
    curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash - > /dev/null
    echo " [DONE]"
    printf "Installing NodeJS"
    apt-get install -y nodejs > /dev/null
    echo " [DONE]"
    printf "Installing NPM"
    apt-get install -y npm > /dev/null
    echo " [DONE]"
}

function installIndividual {
    echo "Prompt for each"
}
printf "\033c"
echo "Ubuntu Development Suite Installer"
echo "The following software and all of it's dependencies will be installed:"
echo "- NodeJS, NPM, NVM"
echo "- Visual Studio Code"
echo "- python"
echo "- make, cmake, g++"
echo "- build-essential"
while true; do
    read -p "Do you wish to install the whole package? Otherwise you'll be asked for each package. [Y/n] " installAll
    case $installAll in
        [Yy]* ) installAll; break;;
        [Nn]* ) installIndividual; break;;
    esac
done