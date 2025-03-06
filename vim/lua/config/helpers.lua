-- Key mappings
function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Create directories if they don't exist
function EnsureDir(path)
    local fn = vim.fn
    local dir = fn.expand(path)
    if fn.isdirectory(dir) == 0 then
        fn.mkdir(dir, 'p')
    end
end

