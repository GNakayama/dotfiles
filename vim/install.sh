#!/bin/bash

# Creates backup directory
if [ ! -d "$HOME/.vim/bundle/" ]; then
	/bin/mkdir -p "$HOME/.vim/tmp/backup"
fi

# Creates undo directory
if [ ! -d "$HOME/.vim/bundle/" ]; then
	/bin/mkdir -p "$HOME/.vim/tmp/undo"
fi

# Creates swap directory
if [ ! -d "$HOME/.vim/bundle/" ]; then
	/bin/mkdir -p "$HOME/.vim/tmp/swap"
fi

# Creates bundle directory
if [ ! -d "$HOME/.vim/bundle/" ]; then
	/bin/mkdir -p "$HOME/.vim/bundle"
fi

# Install Vundle plugin manager
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
	/bin/git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

if [ -f "$HOME/.vimrc" ]; then
	/bin/rm "$HOME/.vimrc"
fi

if [ -f "$HOME/.vim/templates" ]; then
	/bin/rm -r "$HOME/.vim/templates"
fi


/bin/ln .vimrc $HOME/.vimrc
/bin/ln -s $(/bin/pwd)/templates $HOME/.vim/templates
/bin/vim +PluginInstall +qall

# Install neovim
if [ ! -d "$HOME/.config/nvim/" ]; then
	/bin/mkdir -p "$HOME/.config/nvim"
fi

if [ -f "$HOME/.config/nvim/init.vim" ]; then
	/bin/rm "$HOME/.config/nvim/init.vim"
fi

/bin/ln init.vim $HOME/.config/nvim/init.vim

/bin/nvim +'CocInstall coc-python coc-css coc-html coc-json coc-tsserver coc-eslint coc-json coc-sqlfluff coc-go coc-terraform coc-yaml coc-lua' +qall

if ! yay -Qi nvim 1> /dev/null 2>&1; then
	yay neovim
	yay tree-sitter
fi

# Install ctags if it is not installed
if ! yay -Qi universal-ctags-git 1> /dev/null 2>&1; then
	yay universal-ctags-git
fi

sudo pacman -S python-pynvim
