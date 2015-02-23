" Load and initialise NeoBundle and plugins

if !exists( "g:bundles_dir" )
	let g:bundles_dir = g:vim_vardata . "/bundles/"
elseif g:bundles_dir !~ "/$"
	let g:bundles_dir = g:bundles_dir . "/"
endif
if !CreateDirectoryIfNecessary( g:bundles_dir )
	unlet g:bundles_dir
	finish
endif

if has( 'vim_starting' )
	if &compatible
		set nocompatible
	endif

	if isdirectory( g:bundles_dir . "neobundle.vim" )
		let s:neobundle_path = g:bundles_dir . "neobundle.vim"
	else
		let s:neobundle_path = g:vim_home . "/neobundle-initial"
	endif
	let &g:runtimepath = &g:runtimepath . "," . s:neobundle_path
endif

call neobundle#begin( g:bundles_dir )

" Load NeoBundle itself, as well as VimProc
NeoBundleFetch 'Shougo/neobundle.vim'

" Load all plugins from bundles-init/*.load
let s:binit_dir = g:vim_home . "/bundles-init"
for s:plfn in glob( s:binit_dir . "/*.load.vim" , 0 , 1 )
	execute "source" s:plfn

	" Create configuration loading hooks
	let s:pname = fnamemodify( s:plfn , ":t:r:r" )
	let s:bundle = neobundle#get( s:pname )

	function! s:bundle.hooks.on_post_source( bundle )
		let cfgfile = s:binit_dir . "/" . a:bundle.name . ".cfg.vim"
		if filereadable( l:cfgfile )
			execute "source" l:cfgfile
		endif
	endfunction
endfor

call neobundle#end()
