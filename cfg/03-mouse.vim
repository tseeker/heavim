" Enable mouse by default, provide <Leader>om shortcut to toggle on/off

function! <SID>ToggleMouse()
	if &g:mouse != ""
		echo "Mouse disabled."
		set mouse=
	else
		echo "Mouse enabled."
		set mouse=a
	endif
endfunction

set mouse=a
nnoremap <silent> <Leader>om :call <SID>ToggleMouse()<cr>
