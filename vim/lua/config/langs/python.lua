-- Python formatting functions
_G.format_python = function()
  vim.cmd(':Isort')
  vim.cmd(':Black')
end

_G.enable_black = function()
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.py",
    callback = function()
      vim.cmd('silent! Black')
    end
  })
end

_G.disable_black = function()
  vim.api.nvim_del_autocmd_by_pattern("BufWritePost", "*.py")
end

_G.pycln = function()
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.py",
    callback = function()
      vim.cmd('silent! !pycln -a -x .')
      vim.cmd('e')
    end
  })
end

-- Python formatting on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.py",
  callback = function()
    vim.cmd('silent! lua format_python()')
  end
})

-- Insert pdb
Map('n', '<Leader>D', function()
    local trace = "import pdb; pdb.set_trace()"
    vim.api.nvim_put({trace}, 'l', true, true)
end)

---- Execute current .py file
Map('n', '<F9>', ':exec \'!clear; python "%:p"\' <CR>')

