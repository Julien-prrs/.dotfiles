#!/bin/bash

TPM_PATH="$HOME/.tmux/plugins/tpm"

if [ ! -d $TPM_PATH ]; then
   git clone https://github.com/tmux-plugins/tpm $TPM_PATH
fi

exec $HOME/.tmux/plugins/tpm/bin/install_plugins
