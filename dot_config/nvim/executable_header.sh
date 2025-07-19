#!/bin/bash
echo -e "\e[1;34m$(figlet -W -f ~/.config/nvim/ansi_shadow $(echo $1 | rev | cut -d/ -f1 | rev) -w 120)\e[0m" | head -n7
