#!/bin/bash

if [ -f "$HOME/.config/nvim/init.lua" ]; then
	/bin/rm "$HOME/.config/nvim/init.lua"
fi

/bin/ln init.lua $HOME/.config/nvim/init.lua

if [ -f "$HOME/.config/nvim/coc-settings.json" ]; then
	/bin/rm "$HOME/.config/nvim/coc-settings.json"
fi

/bin/ln coc-settings.json $HOME/.config/nvim/coc-settings.json

if [ -d "$HOME/.config/nvim/lua" ]; then
	/bin/rm -rf "$HOME/.config/nvim/lua"
fi

/bin/mkdir -p "$HOME/.config/nvim/lua/configs/maps"
/bin/mkdir -p "$HOME/.config/nvim/lua/plugins"

/bin/ln lua/configs/maps/fugitive.lua $HOME/.config/nvim/lua/configs/maps/fugitive.lua
/bin/ln lua/configs/maps/navigation.lua $HOME/.config/nvim/lua/configs/maps/navigation.lua
/bin/ln lua/configs/default.lua $HOME/.config/nvim/lua/configs/default.lua
/bin/ln lua/configs/maps.lua $HOME/.config/nvim/lua/configs/maps.lua
/bin/ln lua/configs/identation.lua $HOME/.config/nvim/lua/configs/identation.lua
/bin/ln lua/configs/backup.lua $HOME/.config/nvim/lua/configs/backup.lua
/bin/ln lua/plugins/coc.lua $HOME/.config/nvim/lua/plugins/coc.lua
/bin/ln lua/plugins/lazy.lua $HOME/.config/nvim/lua/plugins/lazy.lua
/bin/ln lua/plugins/neo-tree.lua $HOME/.config/nvim/lua/plugins/neo-tree.lua
/bin/ln lua/plugins/telescope.lua $HOME/.config/nvim/lua/plugins/telescope.lua

/bin/cp -R templates $HOME/.config/nvim
