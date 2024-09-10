if vim.fn.has('persistent_undo') == 1 then
    vim.opt.undodir = "/home/nakayama/.vim/tmp/undo/"
    vim.opt.undofile = true
    vim.opt.undolevels = 3000
    vim.opt.undoreload = 10000
end

vim.opt.backupdir = "/home/nakayama/.vim/tmp/backup/"
vim.opt.directory = "/home/nakayama/.vim/tmp/swap/"
vim.opt.backup = true
vim.opt.swapfile = false
