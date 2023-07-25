#!/bin/bash

type nvim &> /dev/null

if [ $? -ne 0 ]; then
   git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
fi
