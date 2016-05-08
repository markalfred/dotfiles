#!/bin/sh

# Create symlinks for files expected to be in particular places.

if [ ! -d ~/.config/ ]
  then ln -s ~/Repos/dotfiles/ ~/.config/ > /dev/null 2>&1
fi

if [ ! -d ~/.config/ ]
  then ln -s '/Users/mark/Library/Application Support/Sublime Text 3/Packages/User' ~/.config/sublime/ > /dev/null 2>&1
fi

ln -s ~/.config/.eslintrc.js ~/.eslintrc.js
ln -s ~/.config/.spacemacs ~/.spacemacs
ln -s ~/.config/flexget ~/.flexget
ln -s ~/.config/git/.gitconfig ~/.gitconfig
ln -s ~/.config/git/.gitignore_global ~/.gitignore_global
ln -s ~/.config/rbenv/default-gems ~/.rbenv/default-gems
ln -s ~/.config/slate/slate.js ~/.slate.js
ln -s ~/.config/tig/.tigrc ~/.tigrc
ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.config/vim/vimrc.vim ~/.vimrc
