#!/bin/bash

type nvm &> /dev/null

if [ $? -ne 0 ]; then
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
fi
