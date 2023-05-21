#!/bin/bash

PACKAGES_TO_INSTALL="fish fzf"
OMF_INSTALL_PATH="$HOME/.local/share/omf"

for package in $PACKAGES_TO_INSTALL; do
   type $package &> /dev/null
   if [ $? -eq 0 ]; then
      PACKAGES_TO_INSTALL=${PACKAGES_TO_INSTALL//$package/}
   fi
done

if [ ! -z $PACKAGES_TO_INSTALL ]; then
   if [[ -f /etc/arch-release ]]; then
      sudo pacman -S $PACKAGES_TO_INSTALL
   elif [[ -f /etc/debian_version ]]; then
      sudo apt-get install $PACKAGES_TO_INSTALL
   fi
fi

if [ ! -d $OMF_INSTALL_PATH ]; then
   curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fi

fish -c "omf install"
