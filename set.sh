#!/bin/sh
#  __ __       ___       ____
# /\ \\ \    /'___`\    /\  _`\
# \ \ \\ \  /\_\ /\ \   \ \ \L\ \  _ __    __   __  __  __
#  \ \ \\ \_\/_/// /__   \ \  _ <'/\`'__\/'__`\/\ \/\ \/\ \
#   \ \__ ,__\ // /_\ \   \ \ \L\ \ \ \//\  __/\ \ \_/ \_/ \
#    \/_/\_\_//\______/    \ \____/\ \_\\ \____\\ \___x___/'
#       \/_/  \/_____/      \/___/  \/_/ \/____/ \/__//__/
#
# ./set.sh

# Delete and reinstall Homebrew from Homebrew Github repo
rm -rf $HOME/.brew
git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew

# Create .brewconfig script in $HOME dir
cat > $HOME/.brewconfig.zsh <<EOL
# HOMEBREW CONFIG

# Add brew to path
export PATH=\$HOME/.brew/bin:\$PATH

# Set Homebrew temporary folders
export HOMEBREW_CACHE=/tmp/\$USER/Homebrew/Caches
export HOMEBREW_TEMP=/tmp/\$USER/Homebrew/Temp

mkdir -p \$HOMEBREW_CACHE
mkdir -p \$HOMEBREW_TEMP

# If NFS session
# Symlink Locks folder in /tmp
if df -T autofs,nfs \$HOME 1>/dev/null
then
  HOMEBREW_LOCKS_TARGET=/tmp/\$USER/Homebrew/Locks
  HOMEBREW_LOCKS_FOLDER=\$HOME/.brew/var/homebrew

  mkdir -p \$HOMEBREW_LOCKS_TARGET
  mkdir -p \$HOMEBREW_LOCKS_FOLDER

  # Symlink to Locks target folders
  # If not already a symlink
  if ! [[ -L \$HOMEBREW_LOCKS_FOLDER && -d \$HOMEBREW_LOCKS_FOLDER ]]
  then
     echo "Creating symlink for Locks folder"
     rm -rf \$HOMEBREW_LOCKS_FOLDER
     ln -s \$HOMEBREW_LOCKS_TARGET \$HOMEBREW_LOCKS_FOLDER
  fi
fi
EOL

# Add .brewconfig sourcing in your .zshrc if not already present
if ! grep -q "# Load Homebrew config script" $HOME/.zshrc
then
cat >> $HOME/.zshrc <<EOL

# Load Homebrew config script
source \$HOME/.brewconfig.zsh
EOL
fi

source $HOME/.brewconfig.zsh
rehash
brew update

# Reload .zshrc
source $HOME/.zshrc
echo "\n 42brew is now properly set."
