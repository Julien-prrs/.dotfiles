#!/bin/bash

TPM_PATH="$HOME/.tmux/plugins/tpm"

if [ ! -z 'tmux' ]; then
   if [[ -f /etc/arch-release ]]; then
      sudo pacman -Syu --noconfirm tmux
   elif [[ -f /etc/debian_version ]]; then
      sudo apt-get install tmux
   fi
fi

if [ ! -d $TPM_PATH ]; then
   git clone https://github.com/tmux-plugins/tpm $TPM_PATH
fi

exec $HOME/.tmux/plugins/tpm/bin/install_plugins
