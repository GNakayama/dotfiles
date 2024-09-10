---- pycln
--function Pycln()
--	autocmd BufWritePost *.py silent! execute ':!pycln -a -x .'
--	execute ':e'
--endfunction

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

---- Insert pdb
--function! InsertLine()
--  let trace = expand("import pdb; pdb.set_trace()")
--  execute "normal o".trace
--endfunction

--map <Leader>D :call InsertLine()<CR>

---- Execute current .py file
--au BufEnter,BufNew *.py map <F9> :exec '!clear; python "%:p"' <Enter>

