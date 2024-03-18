#!/bin/bash

create_symlinks() {
  script_dir=$(dirname "$(readlink -f "$0")")
  files=$(find -maxdepth 1 -type f -name ".*")

  for file in $files; do
    name=$(basename $file)
    rm -rf ~/$name
    ln -s $script_dir/$name ~/$name
  done
}

echo "Creating symlinks"
create_symlinks

echo "Installing fonts"
FONT_DIR="$HOME/.fonts"
git clone https://github.com/powerline/fonts.git $FONT_DIR --depth=1
cd $FONT_DIR
./install.sh

echo "Setting up Spaceship theme"
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
