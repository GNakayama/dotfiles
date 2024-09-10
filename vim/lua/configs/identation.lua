vim.opt.encoding = 'utf-8'  --The encoding displayed
vim.opt.fileencoding = 'utf-8'  -- The encoding written to file.
vim.opt.hlsearch = true -- Highlight all search results
vim.opt.spell = true

-- -- Enable folding
vim.opt.foldmethod = indent
vim.opt.foldlevel = 99

vim.cmd("filetype plugin indent on") -- required
vim.cmd("syntax enable")

--- Default identation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.shiftround = true
vim.opt.fileformat = "unix"

---- Identation
vim.api.nvim_create_autocmd(
    {"BufNewFile" ,"BufRead"},
    {
    pattern = {"*.ts", "*.js", "*.tsx", "*.jsx", "*.json", ".scss", ".css", ".html"},
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
        vim.opt.shiftwidth = 2
    end
})

---- Flag Whitespaces
vim.cmd[[highlight BadWhitespace ctermbg=white]]
vim.api.nvim_create_autocmd(
    {"BufRead", "BufNewFile"},
    {
        pattern = {"*.py", "*html", "*.rb", "*.vim", "*.elm", "*.lua"},
        callback = function()
            vim.cmd[[match BadWhitespace /\s\+$/]]
        end
    }
)

---- Line Numbering
vim.o.number = true
---
---- Set line wrap
vim.o.wrap = true
vim.o.linebreak = true
vim.o.list = false

-- Color scheme
vim.cmd[[colorscheme tokyonight-storm]]
