#!/bin/sh
#  __ __       ___       ____
# /\ \\ \    /'___`\    /\  _`\
# \ \ \\ \  /\_\ /\ \   \ \ \L\ \  _ __    __   __  __  __
#  \ \ \\ \_\/_/// /__   \ \  _ <'/\`'__\/'__`\/\ \/\ \/\ \
#   \ \__ ,__\ // /_\ \   \ \ \L\ \ \ \//\  __/\ \ \_/ \_/ \
#    \/_/\_\_//\______/    \ \____/\ \_\\ \____\\ \___x___/'
#		\/_/  \/_____/      \/___/  \/_/ \/____/ \/__//__/
#
# ./unset.sh


# Clean .zshrc and make a backup (.bak)
sed -i.bak '/Load Homebrew/d' $HOME/.zshrc
sed -i.bak '/brewconfig.zsh/d' $HOME/.zshrc

# Delete .brewconfig.zsh
rm $HOME/.brewconfig.zsh

# Reload .zshrc
source $HOME/.zshrc
echo "\n 42brew is now properly unset."
