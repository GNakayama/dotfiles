local set = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }

---- Only open Neotree if no file was specified on startup
vim.api.nvim_create_autocmd({"VimEnter"}, {
  pattern = {"*"},
  callback = function(ev)
	vim.cmd[[Neotree]]
  end
})

set('n', '<C-D>', ':Neotree toggle<CR>', ns)
