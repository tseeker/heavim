" Enable mouse by default, provide <Leader>M shortcut to toggle on/off

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

nnoremap <silent> <Leader>M :call <SID>ToggleMouse()<cr>
vnoremap <silent> <C-c> "+y
set pastetoggle=<Leader>P
