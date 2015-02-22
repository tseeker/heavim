" Main VIM configuration file: only serves as a loader


" If another runtime directory is specified, use it
let s:own_path = expand( '<sfile>:p:h' )
let $VIM_HOME = $VIM_HOME == '' ? '' 
	\ : fnamemodify( $VIM_HOME . '/x' , ':p:h' )

if $VIM_HOME == '' || $VIM_HOME == s:own_path
	" Default configuration directory
	let $VIM_HOME = s:own_path
	let g:vim_home = fnameescape( $VIM_HOME )
	let g:vim_vimrc = fnameescape( $VIM_HOME . '/vimrc' )
else
	" Use another configuration directory
	let g:vim_home = fnameescape( $VIM_HOME )
	let g:vim_vimrc = fnameescape( $VIM_HOME . '/vimrc' )
	let &rtp = printf(
		\ '%s/vimfiles,%s,%s,%s/vimfiles/after,%s/after' ,
		\ $VIM , $VIMRUNTIME , g:vim_home , $VIM , g:vim_home )
	if filereadable( g:vim_vimrc )
		execute 'source ' . g:vim_vimrc
	endif
	finish
endif

" Execute configuration in config-bits
let s:cfg_bits_path = g:vim_home . '/config-bits'
let s:cfg_files = glob( s:cfg_bits_path . '/??-?*.vim' )
for s:cfg_file in sort( split( s:cfg_files , "\n" ) )
	execute 'source ' . s:cfg_file
endfor
