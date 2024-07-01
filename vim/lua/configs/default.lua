-- vim.o.nocompatible = true -- required
-- vim.o.encoding = 'utf-8'  --The encoding displayed
-- vim.o.fileencoding = 'utf-8'  -- The encoding written to file.
-- vim.o.hls = true
-- vim.o.is = true
-- vim.o.nrformats = true
-- vim.o.spell = true

-- -- Enable folding
-- vim.o.foldmethod = indent
-- vim.o.foldlevel = 99

vim.cmd("filetype plugin indent on") -- required
vim.cmd("syntax enable")

---- Identation
--au BufNewFile,BufRead *.py,*.html,*.cpp,*.hpp,*.c,*.h,*.rb,*.vim,*.elm
--    \ set tabstop=4 |
--    \ set softtabstop=4 |
--    \ set shiftwidth=4 |
--    \ set expandtab |
--    \ set autoindent |
--    \ set shiftround |
--    \ set fileformat=unix |
----
---- Identation JS, JSX, JSON
--au BufNewFile,BufRead *.ts,*.js,*.jsx,*.scss,*.json
--    \ set tabstop=2 |
--    \ set softtabstop=2 |
--    \ set shiftwidth=2 |
--    \ set expandtab |
--    \ set autoindent |
--    \ set shiftround |
--    \ set fileformat=unix |

---- Flag Whitespaces
--highlight BadWhiteSpace ctermbg=white
--au BufRead,BufNewFile *.py,*pyw,*.c,*.h,*.js,*.cpp,*.hpp,*.html match BadWhitespace /\s\+$/

---- Leading spaces
--let g:indentLine_enabled = 0
--let g:indentLine_leadingSpaceEnabled = 1
--let g:indentLine_leadingSpaceCha = '.'

---- Line Numbering
--set nu

---- Backups
--if has('persistent_undo')
--	set undodir=~/.vim/tmp/undo//     -- undo files
--	set undofile
--	set undolevels=3000
--	set undoreload=10000
--endif

--set backupdir=~/.vim/tmp/backup// -- backups
--set directory=~/.vim/tmp/swap//   -- swap files
--set backup
--set noswapfile

---- Set line wrap
--set wrap
--set linebreak
--set nolist
--map j gj
--map k gk

-- Color scheme
vim.cmd[[colorscheme tokyonight-storm]]
