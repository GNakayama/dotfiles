local set = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }

---- Telescope
set('n', '<LEADER>ff', '<CMD>Telescope find_files<CR>', ns)
set('n', '<LEADER>fg', '<CMD>Telescope live_grep<CR>', ns)
set('n', '<LEADER>fb', '<CMD>Telescope buffers<CR>', ns)
set('n', '<LEADER>fh', '<CMD>Telescope help_tags<CR>', ns)
