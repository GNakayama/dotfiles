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

config_files=("maps/fugitive.lua" "maps/navigation.lua" "default.lua" "maps.lua" "identation.lua" "backup.lua" "python.lua" "go.lua" "terraform.lua")

for file in "${config_files[@]}"; do
    /bin/ln "lua/configs/$file" "$HOME/.config/nvim/lua/configs/$file"
done

config_files=("coc.lua" "lazy.lua" "neo-tree.lua" "telescope.lua")

for file in "${config_files[@]}"; do
    /bin/ln "lua/plugins/$file" "$HOME/.config/nvim/lua/plugins/$file"
done

/bin/cp -R templates $HOME/.config/nvim
