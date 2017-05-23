#!/bin/bash
#
# Author: pbrln
# License: MIT

function installAll {
    echo "Installing all tools"
}

function installNode {
    #Add Node to source repos
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
while true; do
    read -p "Do you wish to install the whole package? Otherwise you'll be asked for each package. [Y/n] " installAll
    case $installAll in
        [Yy]* ) installAll; break;;
        [Nn]* ) installIndividual; break;;
    esac
done