" Cursor line & column: ' c' = invert, ' C' = mode, ' n' = line numbers
function! <SID>ToggleCursorMode()
	if &cursorline && &cursorcolumn || !( &cursorline || &cursorcolumn )
		set cursorline nocursorcolumn
	else
		set cursorline cursorcolumn
	endif
endfunction

nnoremap <silent> <Leader>c :set cursorline! cursorcolumn!<CR>
nnoremap <silent> <Leader>C :call <SID>ToggleCursorMode()<CR>
nnoremap <silent> <Leader>n :set number!<CR>

set cursorline number
