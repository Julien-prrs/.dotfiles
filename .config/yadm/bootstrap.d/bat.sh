#!/bin/bash

type bat &> /dev/null

if [ $? -ne 0 ]; then
   if [[ -f /etc/arch-release ]]; then
      sudo pacman -S bat
   elif [[ -f /etc/debian_version ]]; then
      curl -OL https://github.com/sharkdp/bat/releases/download/v0.23.0/bat-musl_0.23.0_amd64.deb --silent
      sudo dpkg -i bat-musl_0.23.0_amd64.deb
      rm bat-musl_0.23.0_amd64.deb
   fi
fi

bat cache --build

