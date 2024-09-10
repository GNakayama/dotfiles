require('configs.maps.navigation')
require('configs.maps.fugitive')

---- Folding with spacebar
--nnoremap <space> za

---- Moving code blocks
--vnoremap < <gv
--vnoremap > >gv

---- copy and paste to/from vIM and the clipboard
--noremap <Leader>Y "*y
--noremap <Leader>P "*p
--noremap <Leader>y "+y
--noremap <Leader>p "+p

---- access system clipboard
--set clipboard=unnamedplus

---- Press Space to turn off highlighting and clear any message already displayed.
--:nnoremap <C-Space> :nohlsearch<Bar>:echo<CR>

---- Folding with spacebar
--nnoremap <space> za

--autocmd BufWritePost *.py silent! execute ':call FormatPython()'

--let g:SimpylFold_docstring_preview=1

--map <Leader>D :call InsertLine()<CR>

---- Powerline
--set laststatus=2
--set t_Co=256
--set statusline=%f
--set statusline+=\ %h%w%m%r
--set statusline+=%=
--set statusline+=%-16(%{exists('g:loaded_fugitive')?fugitive#statusline():''}\%)
--set statusline+=\ %P/%L
--set statusline+=\

--let g:move_key_modifier = 'A'

----Remap
--noremap  <TAB> :tabp<CR>
--noremap  <S-TAB> :tabn<CR>

--nmap <silent> <C-E> :q<CR>

---- Set line wrap
--set wrap
--set linebreak
--set nolist
--map j gj
--map k gk

--let g:python3_host_prog = '/bin/python3'

---- Keybindings
--noremap <esc>[1;5D <CLeft>
--inoremap <silent> <C-S> <C-C>:update<CR>
--noremap <silent> <C-S> :update<CR>
--noremap <silent> <CLeft-L> :copen<CR>

--let g:python3_host_prog = '/bin/python3'

--map j gj
--map k gk
