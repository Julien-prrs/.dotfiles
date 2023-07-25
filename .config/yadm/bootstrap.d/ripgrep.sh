#!/bin/bash

type rg &> /dev/null

if [ $? -ne 0 ]; then
   if [[ -f /etc/arch-release ]]; then
      sudo pacman -Syu --noconfirm ripgrep
   elif [[ -f /etc/debian_version ]]; then
      sudo apt-get install ripgrep
   fi
fi
