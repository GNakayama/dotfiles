if vim.fn.has('persistent_undo') == 1 then
    vim.opt.undodir = "~/.vim/tmp/undo//"
    vim.opt.undofile = true
    vim.opt.undolevels = 3000
    vim.opt.undoreload = 10000
end

vim.opt.backupdir = "~/.vim/tmp/backup//"
vim.opt.directory = "~/.vim/tmp/swap//"
vim.opt.backup = true
vim.opt.swapfile = false
