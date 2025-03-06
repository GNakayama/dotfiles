require("config.helpers")

---- Fugitive keybindings
Map('n', '<up>', ':Gread<CR>')
Map('n', '<down>', ':Gdiff<CR>')
Map('n', '<left>', ':Gstatus<CR>')
Map('n', '<right>', ':Gblame<CR>')
Map('n', '<C-up>', ':Git push<CR>')
Map('n', '<C-down>', ':Git pull<CR>')
Map('n', '<C-left>', ':Gcommit<CR>')
