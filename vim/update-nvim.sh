#!/bin/bash

if [ -f "$HOME/.config/nvim/init.lua" ]; then
	/bin/rm "$HOME/.config/nvim/init.lua"
fi

if [ -f "$HOME/.config/nvim/init.vim" ]; then
	/bin/mv "$HOME/.config/nvim/init.vim" "$HOME/.config/nvim/init.vim.bk"
fi

/bin/ln init.lua $HOME/.config/nvim/init.lua

if [ -f "$HOME/.config/nvim/coc-settings.json" ]; then
	/bin/mv "$HOME/.config/nvim/coc-settings.json" "$HOME/.config/nvim/coc-settings.json.bk"
fi

/bin/ln coc-settings.json $HOME/.config/nvim/coc-settings.json

if [ -d "$HOME/.config/nvim/lua" ]; then
	/bin/rm -rf "$HOME/.config/nvim/lua"
fi

/bin/mkdir -p "$HOME/.config/nvim/lua/config/langs"
/bin/mkdir -p "$HOME/.config/nvim/lua/config/maps"
/bin/mkdir -p "$HOME/.config/nvim/lua/config/plugins"

config_files=("backup.lua" "clipboard.lua" "helpers.lua" "identation.lua" "init.lua" "maps.lua")

for file in "${config_files[@]}"; do
    /bin/ln "lua/config/$file" "$HOME/.config/nvim/lua/config/$file"
done

langs_files=("python.lua" "go.lua")

for file in "${langs_files[@]}"; do
    /bin/ln "lua/config/langs/$file" "$HOME/.config/nvim/lua/config/langs/$file"
done

maps_files=("fugitive.lua" "navigation.lua")

for file in "${maps_files[@]}"; do
    /bin/ln "lua/config/maps/$file" "$HOME/.config/nvim/lua/config/maps/$file"
done

plugins_files=("coc.lua" "lazy.lua" "neo-tree.lua" "telescope.lua")

for file in "${plugins_files[@]}"; do
    /bin/ln "lua/config/plugins/$file" "$HOME/.config/nvim/lua/config/plugins/$file"
done

/bin/cp -R templates $HOME/.config/nvim
