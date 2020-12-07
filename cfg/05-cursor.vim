" Cursor line & column display
function! <SID>ToggleCursorMode()
	if &cursorline && &cursorcolumn || !( &cursorline || &cursorcolumn )
		set cursorline nocursorcolumn
	else
		set cursorline cursorcolumn
	endif
endfunction

set cursorline number
nnoremap <silent> <Leader>oc :set cursorline! cursorcolumn!<CR>
nnoremap <silent> <Leader>oC :call <SID>ToggleCursorMode()<CR>
