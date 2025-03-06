-- Main configuration entry point
-- Load all configuration modules

-- Basic settings
vim.opt.compatible = false
vim.opt.nrformats = ''

-- Load options first (basic vim settings)
require("config.identation")
require("config.backup")
require("config.clipboard")

-- Load plugins
local plugins = require('config.plugins.lazy')

-- Lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Initialize plugins
require("lazy").setup(plugins)
require("config.plugins.neo-tree")
require("config.plugins.telescope")
require("config.plugins.coc")

-- Status line
vim.opt.laststatus = 3
vim.opt.statusline = '%f %h%w%m%r%=%{exists("g:loaded_fugitive")?fugitive#statusline():""} %P/%L'

-- Python host
vim.g.python3_host_prog = '/bin/python3'

-- Plugin settings
vim.g.SimpylFold_docstring_preview = 1
vim.g.move_key_modifier = 'A'

-- Load keymaps
require("config.maps")

-- Load language specific configs
require("config.langs.go")
require("config.langs.python")

 -- Setup plugins
require("lualine").setup()
require("telescope").setup()
require("nvim-web-devicons").get_icons()
require("bufferline").setup()
require("lualine").setup{
  options = { theme  = "moonfly", },
}

-- Colorscheme
vim.cmd('colorscheme tokyonight')
