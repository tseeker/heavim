function! <SID>RunGitOp(op)
	execute "Silent" a:op
	GitGutter
	
	let wins = filter( range( 1 , winnr( '$' ) ) ,
		\ "buffer_name(winbufnr(v:val)) =~ '^NERD_tree_[0-9]\\+$'" )
	if empty( l:wins )
		return
	endif

	let wn = winnr()
	call NERDTreeFocus()
	call feedkeys( "R:" . l:wn . "wincmd w\<cr>:\<esc>" , 't' )
endfunction


let g:gitgutter_map_keys = 0
nnoremap <silent> <Leader>g< :GitGutterPrevHunk<cr>
nnoremap <silent> <Leader>g> :GitGutterNextHunk<cr>
nnoremap <silent> <Leader>g+ :call <SID>RunGitOp( 'GitGutterStageHunk' )<cr>
nnoremap <Leader>g- :GitGutterRevertHunk

nnoremap <silent> <Leader>ga :call <SID>RunGitOp( 'Git add %:p' )<cr>
