require("config.helpers")

-- Clipboard
vim.opt.clipboard = 'unnamedplus'

-- Copy and paste to/from clipboard
Map('n', '<Leader>Y', '"*y')
Map('n', '<Leader>P', '"*p')
Map('n', '<Leader>y', '"+y')
Map('n', '<Leader>p', '"+p')

