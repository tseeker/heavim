" If 'doc' directories exist in the local / main configuration, use them

if isdirectory( g:vim_home . "/doc" )
	execute "helptags" g:vim_home . "/doc"
endif

if exists( "g:vim_local_path" ) && isdirectory( g:vim_local_path . "/doc" )
	execute "helptags" g:vim_local_path . "/doc"
endif
