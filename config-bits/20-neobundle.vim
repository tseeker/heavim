" Load and initialise NeoBundle and plugins

let s:bundles_dir = g:vim_home . "/bundle/"

if has( 'vim_starting' )
	if &compatible
		set nocompatible
	endif

	let s:neobundle_path=s:bundles_dir . "neobundle.vim/"
	let &g:runtimepath = &g:runtimepath . "," . s:neobundle_path
endif

call neobundle#begin( s:bundles_dir )

NeoBundleFetch 'Shougo/neobundle.vim'

call neobundle#end()
