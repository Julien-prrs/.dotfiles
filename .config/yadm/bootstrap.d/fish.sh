#!/bin/bash

PACKAGES_TO_INSTALL="fish fzf"
OMF_INSTALL_PATH="$HOME/.local/share/omf"

for package in $PACKAGES_TO_INSTALL; do
   type $package &> /dev/null
   if [ $? -ne 0 ]; then
      if [[ -f /etc/arch-release ]]; then
         sudo pacman -Syu --noconfirm $package
      elif [[ -f /etc/debian_version ]]; then
         sudo apt-get install $package
      fi
   fi
done

if [ ! -d $OMF_INSTALL_PATH ]; then
   curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fi

fish -c "omf install"
