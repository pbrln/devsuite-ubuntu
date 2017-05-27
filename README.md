# Ubuntu Development Suite

Ubuntu Development Suite is a bash script to jumpstart your Ubuntu system for development purposes.  
Software packages that'll be installed can be seen under "Software Packages".

## Dependencies
- curl
- git (will be installed if it isn't)

## Software Packages
- GIT
- NodeJS & Yarn
- VSCode
- python
- make, cmake, g++
- build-essential
- zsh with zim

## Install on fresh system
```apt -qq install curl && /bin/bash <(curl -s "https://raw.githubusercontent.com/pbrln/devsuite-ubuntu/master/dev-suite.sh")```