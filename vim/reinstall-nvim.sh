#!/bin/bash

/bin/cp $HOME/.vimrc ./.vimrc

if [ -f "$HOME/.config/nvim/init.lua" ]; then
	/bin/rm "$HOME/.config/nvim/init.lua"
fi

/bin/ln init.lua $HOME/.config/nvim/init.lua
/bin/cp -R lua $HOME/.config/nvim
