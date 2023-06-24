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

" Use a bar-like cursor in insert mode, and a blinking block in replace mode
let &t_SI = "\e[6 q"
let &t_SR = "\e[0 q"
let &t_EI = "\e[2 q"
