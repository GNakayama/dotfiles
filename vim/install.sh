#!/bin/bash

# Function to create directories if they don't exist
create_dirs() {
    for dir in "$@"; do
        [ ! -d "$dir" ] && /bin/mkdir -p "$dir"
    done
}

# Function to link files
link_files() {
    local src_dir="$1"
    local dest_dir="$2"
    shift 2
    
    for file in "$@"; do
        /bin/ln -f "$src_dir/$file" "$dest_dir/$file"
    done
}

# Install packages if not already installed
if ! yay -Qi nvim 1> /dev/null 2>&1; then
    yay -S neovim tree-sitter
fi


if ! yay -Qi universal-ctags-git 1> /dev/null 2>&1; then
    yay -S universal-ctags-git
fi

sudo pacman -S python-pynvim

# Remove existing lua directory if it exists
[ -d "$HOME/.config/nvim/lua" ] && /bin/rm -rf "$HOME/.config/nvim/lua"

# Create necessary directories
create_dirs "$HOME/.vim/tmp/backup" \
            "$HOME/.vim/tmp/undo" \
            "$HOME/.vim/tmp/swap" \
            "$HOME/.config/nvim" \
            "$HOME/.config/nvim/lua/config/langs" \
            "$HOME/.config/nvim/lua/config/maps" \
            "$HOME/.config/nvim/lua/config/plugins"

# Link main config files
/bin/ln -f init.lua "$HOME/.config/nvim/init.lua"
/bin/ln -f coc-settings.json "$HOME/.config/nvim/coc-settings.json"

# Link configuration files by category
link_files "lua/config" "$HOME/.config/nvim/lua/config" \
    "backup.lua" "clipboard.lua" "helpers.lua" "identation.lua" "init.lua" "maps.lua"

link_files "lua/config/langs" "$HOME/.config/nvim/lua/config/langs" \
    "python.lua" "go.lua"

link_files "lua/config/maps" "$HOME/.config/nvim/lua/config/maps" \
    "fugitive.lua" "navigation.lua" "codecompanion.lua"

link_files "lua/config/plugins" "$HOME/.config/nvim/lua/config/plugins" \
    "coc.lua" "lazy.lua" "neo-tree.lua" "telescope.lua"

# Copy templates directory
/bin/cp -R templates "$HOME/.config/nvim"

# Install Coc extensions
/bin/nvim +'CocInstall coc-python coc-css coc-html coc-json coc-tsserver coc-eslint coc-sqlfluff coc-go coc-yaml coc-lua coc-rust-analyzer coc-pyright' +qall
npm i -g typescript typescript-language-server

# codecompanion setup
/bin/nvim +'TSInstall markdown markdown_inline'
