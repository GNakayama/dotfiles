#!/bin/bash

if [ -f "$HOME/.config/nvim/init.lua" ]; then
	/bin/rm "$HOME/.config/nvim/init.lua"
fi

/bin/ln init.lua $HOME/.config/nvim/init.lua

if [ -f "$HOME/.config/nvim/coc-settings.json" ]; then
	/bin/rm "$HOME/.config/nvim/coc-settings.json"
fi

/bin/ln coc-settings.json $HOME/.config/nvim/coc-settings.json

/bin/cp -R lua $HOME/.config/nvim
/bin/cp -R templates $HOME/.config/nvim
