local set = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }

---- Fugitive keybindings
set('n', '<up>', ':Gread<CR>', ns)
set('n', '<down>', ':Gdiff<CR>', ns)
set('n', '<left>', ':Gstatus<CR>', ns)
set('n', '<right>', ':Gblame<CR>', ns)
set('n', '<C-up>', ':Git push<CR>', ns)
set('n', '<C-down>', ':Git pull<CR>', ns)
set('n', '<C-left>', ':Gcommit<CR>', ns)
