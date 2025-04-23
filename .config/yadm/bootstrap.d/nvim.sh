#!/bin/bash

REQUIRED_VERSION=0.11.0
APPIMAGES_INSTALL_DIR=$HOME/appimages
INSTALL_FAILED=false

# Helper function to compare versions
version_ge() {
  [ "$(printf '%s\n' "$1" "$2" | sort -V | head -n1)" = "$2" ]
}

type nvim &> /dev/null

if [ $? -ne 0 ]; then
   if [[ -f /etc/arch-release ]]; then
      AVAILABLE_VERSION=$(pacman -Si neovim 2>/dev/null | awk -F': ' '/^Version/ { print $2 }')
      if version_ge "$AVAILABLE_VERSION" "$REQUIRED_VERSION"; then
         sudo pacman -Syu --noconfirm neovim
      else
         INSTALL_FAILED=true
      fi
   elif [[ -f /etc/debian_version ]]; then
      sudo apt-get satisfy "neovim (>= $REQUIRED_VERSION)" -y
   fi

   # Fallback to appimage if previous installation failed
   if [ $? -ne 0 ] || [ "$INSTALL_FAILED" = true ]; then
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
