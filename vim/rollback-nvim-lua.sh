if [ -f "$HOME/.config/nvim/init.lua" ]; then
	/bin/rm "$HOME/.config/nvim/init.lua"
fi

if [ -f "$HOME/.config/nvim/init.vim.bk" ]; then
	/bin/mv "$HOME/.config/nvim/init.vim.bk" "$HOME/.config/nvim/init.vim"
fi

if [ -f "$HOME/.config/nvim/coc-settings.json.bk" ]; then
	/bin/mv "$HOME/.config/nvim/coc-settings.json.bk" "$HOME/.config/nvim/coc-settings.json"
fi

if [ -d "$HOME/.config/nvim/lua" ]; then
	/bin/rm -rf "$HOME/.config/nvim/lua"
fi
