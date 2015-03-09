" Set autochdir, unless there's a local configuration in the current
" directory.
if !exists( "g:vim_local_path" )
	set autochdir
endif
