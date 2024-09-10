---- Press Space to turn off highlighting and clear any message already displayed.
--:nnoremap <C-Space> :nohlsearch<Bar>:echo<CR>

---- pycln
--function Pycln()
--	autocmd BufWritePost *.py silent! execute ':!pycln -a -x .'
--	execute ':e'
--endfunction

---- Terraform
--let g:terraform_fmt_on_save=1

---- Black
--function EnableBlack()
--	autocmd BufWritePost *.py silent! execute ':Black'
--endfunction

--function DisableBlack()
--	autocmd! BufWritePost *.py
--endfunction

---- ISort
--function FormatPython()
--       execute ':Isort'
--       execute ':Black'
--endfunction

--autocmd BufWritePost *.py silent! execute ':call FormatPython()'

---- Go
--let g:go_fmt_command = "goimports"
--let g:go_metalinter_autosave = 1
--let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'deadcode']
--let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
----
---- Execute current .py file
--au BufEnter,BufNew *.py map <F9> :exec '!clear; python "%:p"' <Enter>

---- Cat file content
--noremap <F10> :exec '!cat "%:p"' <Enter>

---- Insert pdb
--function! InsertLine()
--  let trace = expand("import pdb; pdb.set_trace()")
--  execute "normal o".trace
--endfunction

--map <Leader>D :call InsertLine()<CR>
