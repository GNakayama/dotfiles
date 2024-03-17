set nocompatible " required
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.
set hls
set is
set nrformats=

" Enable folding
set foldmethod=indent
set foldlevel=99

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <C-Space> :nohlsearch<Bar>:echo<CR>

" Folding with spacebar
nnoremap <space> za

" set the runtime path to include Vundle and initialize
filetype off     " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all Plugins here
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'ambv/black'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-commentary'
Plugin 'matze/vim-move'
Plugin 'majutsushi/tagbar'
Plugin 'Yggdroot/indentLine'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'rainerborene/vim-reek'
Plugin 'hashivim/vim-terraform'
Plugin 'fatih/vim-go'
Plugin 'fisadev/vim-isort'
Plugin 'avakhov/vim-yaml'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'w0rp/ale'
Plugin 'igemnace/vim-template-lite'
Plugin 'junegunn/vader.vim'
Plugin 'rubik/vim-radon'
Plugin 'ryanoasis/vim-devicons'

call vundle#end()            " required
filetype plugin indent on    " required
syntax enable

""" VIM-TEMPLATE-LITE {{{
" declare mappings of patterns to templates to load
let g:template_lite_mappings = {
  \  '*.component.jsx': 'react/component.jsx',
  \  '*.hoc.jsx': 'react/hoc.jsx',
  \}

" All Plugins must be added before the following line

" pycln
function Pycln()
	autocmd BufWritePost *.py silent! execute ':!pycln -a -x .'
	execute ':e'
endfunction

" Terraform
let g:terraform_fmt_on_save=1

" Black
function EnableBlack()
	autocmd BufWritePost *.py silent! execute ':Black'
endfunction

function DisableBlack()
	autocmd! BufWritePost *.py
endfunction

" ISort
function FormatPython()
       execute ':Isort'
       "execute ':Black'
endfunction

autocmd BufWritePost *.py silent! execute ':call FormatPython()'


" CtrlP
nnoremap <leader>f :CtrlPTag<cr>

" Ctags
nnoremap <leader>c :!ctags -R<cr>
set notagrelative

" Ale
let g:ale_python_pylint_options = '--load-plugins pylint_django'
let g:ale_python_flake8_args = '--ignore=E501,W508,W503'
let g:ale_python_flake8_executable = 'flake8'
let g:ale_python_flake8_options = '--ignore=E501,W508,W503'
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'importjs', 'prettier'],
\}

let g:SimpylFold_docstring_preview=1

" Go
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'deadcode']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
"
" Execute current .py file
au BufEnter,BufNew *.py map <F9> :exec '!clear; python "%:p"' <Enter>

" Cat file content
noremap <F10> :exec '!cat "%:p"' <Enter>

" Insert pdb
function! InsertLine()
  let trace = expand("import pdb; pdb.set_trace()")
  execute "normal o".trace
endfunction

map <Leader>D :call InsertLine()<CR>

" copy and paste to/from vIM and the clipboard
noremap <Leader>Y "*y
noremap <Leader>P "*p
noremap <Leader>y "+y
noremap <Leader>p "+p

" access system clipboard
set clipboard=unnamedplus

" Identation
au BufNewFile,BufRead *.py,*.html,*.cpp,*.hpp,*.c,*.h,*.rb,*.vim
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set shiftround |
    \ set fileformat=unix |
"
" Identation JS, JSX, JSON
au BufNewFile,BufRead *.js,*.jsx,*.scss,*.json
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |
    \ set shiftround |
    \ set fileformat=unix |

" Flag Whitespaces
highlight BadWhiteSpace ctermbg=white
au BufRead,BufNewFile *.py,*pyw,*.c,*.h,*.js,*.cpp,*.hpp,*.html match BadWhitespace /\s\+$/

" Choose colorscheme
if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif

" Leading spaces
let g:indentLine_enabled = 0
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceCha = '.'

" Line Numbering
set nu

"Ignore this files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Only open nerdtree if no file was specified on startup
function! StartUpNerdtree()
	if 0 == argc()
		NERDTree
        endif
endfunction

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
autocmd VimEnter * call StartUpNerdtree()

" Backups
if has('persistent_undo')
	set undodir=~/.vim/tmp/undo//     " undo files
	set undofile
	set undolevels=3000
	set undoreload=10000
endif

set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup
set noswapfile

" Powerline
set laststatus=2
set t_Co=256
set statusline=%f
set statusline+=\ %h%w%m%r
set statusline+=%=
set statusline+=%-16(%{exists('g:loaded_fugitive')?fugitive#statusline():''}\%)
set statusline+=\ %P/%L
set statusline+=\

let g:move_key_modifier = 'A'

"Switch split vertical
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

"Remap
noremap  <F6> :NERDTreeTabsToggle<CR>
noremap  <TAB> :tabp<CR>
noremap  <S-TAB> :tabn<CR>
nmap <silent> <C-D> :NERDTreeToggle<CR>

"Tagbar
noremap <F8> :TagbarToggle<CR>

"Disable Arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Reek configuration
let g:reek_line_limit = 110
let g:reek_always_show = 0
let g:reek_on_loading = 0

nmap <silent> <C-E> :q<CR>

" Fugitive keybindings
nmap <silent> <up> :Gread<CR>
nmap <silent> <down> :Gdiff<CR>
nmap <silent> <left> :Gstatus<CR>
nmap <silent> <right> :Gblame<CR>
nmap <silent> <C-up> :Git push<CR>
nmap <silent> <C-down> :Git pull<CR>
nmap <silent> <C-left> :Gcommit<CR>

" Keybindings
noremap <esc>[1;5D <CLeft>
inoremap <silent> <C-S> <C-C>:update<CR>
noremap <silent> <C-S> :update<CR>
noremap <silent> <CLeft-L> :copen<CR>
"
" Set line wrap
set wrap
set linebreak
set nolist
map j gj
map k gk

let g:python3_host_prog = '/bin/python3'

" Radon
let g:radon_always_on = 1

" Moving code blocks
vnoremap < <gv
vnoremap > >gv
