set hidden								" Don't close buffers

" Close buffer
function <SID>CloseCurrentBuffer( )
	let btarget = bufnr( '%' )
	if getbufvar( l:btarget , '&modified' )
		echohl ErrorMsg
		echomsg "No write since last change"
		echohl NONE
		return
	endif

	let wnums = filter( range( 1 , winnr( '$' ) ) ,
		\ 'winbufnr(v:val) == btarget' )
	let wcurrent = winnr( )
	for w in l:wnums
		execute l:w . "wincmd w"
		let prevbuf = bufnr( '#' )
		if l:prevbuf > 0 && buflisted( l:prevbuf ) && l:prevbuf != w
			buffer #
		else
			bprevious
		endif
		if btarget == bufnr('%')
			let blisted = filter( range( 1 , bufnr( '$' ) ) ,
				\ 'buflisted( v:val ) && v:val != btarget' )
			let bhidden = filter( copy( l:blisted ) ,
				\ 'bufwinnr( v:val ) < 0' )
			let bjump = ( l:bhidden + l:blisted + [ -1 ] )[ 0 ]
			if l:bjump > 0
				execute 'buffer ' . l:bjump
			else
				enew
			endif
		endif
	endfor
	execute 'bdelete' l:btarget
	execute l:wcurrent . 'wincmd w'
endfunction

" Buffer navigation (Ctrl, Shift, Arrows...)
nnoremap <silent> <S-Left> :bprev<CR>
nnoremap <silent> <S-Right> :bnext<CR>
nnoremap <silent> <C-S-Down> :call <SID>CloseCurrentBuffer()<CR>

" Buffer navigation (Space sequences)
nnoremap <silent> <Leader>bz :enew<CR>
nnoremap <silent> <Leader>bq :bprev<CR>
nnoremap <silent> <Leader>bd :bnext<CR>
nnoremap <silent> <Leader>bw :call <SID>CloseCurrentBuffer()<CR>
nnoremap <silent> <Leader>bW :bufdo call <SID>CloseCurrentBuffer()<CR>
