local set = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }

-- Navigation
set('n', '<C-h>', '<C-W>h', ns)
set('n', '<C-l>', '<C-W>l', ns)
set('n', '<C-k>', '<C-W>k', ns)
set('n', '<C-j>', '<C-W>j', ns)
set('n', 'q', ':q<CR>', ns)
set('n', '<C-t>', '<C-W>h', ns)

-- Disable Arrow keys in Insert mode
set('i', '<up>', '<nop>', {})
set('i', '<down>', '<nop>', {})
set('i', '<left>', '<nop>', {})
set('i', '<right>', '<nop>', {})

-- Disable Arrows
set('n', '<up>', '<nop>', {})
set('n', '<down>', '<nop>', {})
set('n', '<left>', '<nop>', {})
set('n', '<right>', '<nop>', {})
