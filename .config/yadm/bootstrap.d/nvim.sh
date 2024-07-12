#!/bin/bash

REQUIRED_VERSION=0.10.0
APPIMAGES_INSTALL_DIR=$HOME/appimages

type nvim &> /dev/null

if [ $? -ne 0 ]; then
   if [[ -f /etc/arch-release ]]; then
      sudo pacman -Syu --noconfirm "neovim >= $REQUIRED_VERSION"
   elif [[ -f /etc/debian_version ]]; then
      sudo apt-get satisfy "neovim (>= $REQUIRED_VERSION)" -y
   fi

   # Fallback to appimage if previous installation failed
   if [ $? -ne 0 ]; then
      mkdir -p $APPIMAGES_INSTALL_DIR
      curl -OL https://github.com/neovim/neovim/releases/download/stable/nvim.appimage --silent --output-dir $APPIMAGES_INSTALL_DIR
      chmod +x $APPIMAGES_INSTALL_DIR/nvim.appimage
      sudo ln -s $APPIMAGES_INSTALL_DIR/nvim.appimage /usr/local/bin/nvim
   fi
fi

# Install NvChad if not already installed
if [ ! -f "$HOME/.config/nvim/init.lua" ]; then
   mv $HOME/.config/nvim/lua $HOME/nvim-config-lua.bak
   git clone https://github.com/NvChad/starter $HOME/.config/nvim
   rsync -av $HOME/nvim-config-lua.bak/ $HOME/.config/nvim/lua
   rm -rf $HOME/nvim-config-lua.bak
fi
