" When a local configuration is in use and a file is being opened under the
" local configuration's directory, enable modelines locally. Only allow a
" single modeline.

function! <SID>CheckModelines()
	if !exists( "g:vim_local_path" )
		return
	endif

	let l:file_path = expand( '%:p' )
	let l:vim_local_root = fnamemodify( g:vim_local_path , ':p:h:h' ) . '/'
	let l:lvlr = len( l:vim_local_root )

	if len( l:file_path ) <= l:lvlr
			\ || l:file_path[0:(l:lvlr-1)] !=# l:vim_local_root
		return
	endif

	setlocal modeline
endfunction

set modelines=5
au BufRead * call <SID>CheckModelines()
