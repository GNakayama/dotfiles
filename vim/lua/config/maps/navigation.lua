require("config.helpers")

-- Navigation
Map('n', '<C-h>', '<C-W>h')
Map('n', '<C-l>', '<C-W>l')
Map('n', '<C-k>', '<C-W>k')
Map('n', '<C-j>', '<C-W>j')
Map('n', 'q', ':q<CR>')
Map('n', '<C-t>', '<C-W>h')
Map('n', '<C-E>', ':q<CR>')

-- Disable Arrow keys in Insert mode
Map('i', '<up>', '<nop>')
Map('i', '<down>', '<nop>')
Map('i', '<left>', '<nop>')
Map('i', '<right>', '<nop>')

-- Disable Arrows
Map('n', '<up>', '<nop>')
Map('n', '<down>', '<nop>')
Map('n', '<left>', '<nop>')
Map('n', '<right>', '<nop>')
