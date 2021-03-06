" Load and initialise NeoBundle and plugins

if !exists( "g:bundles_dir" )
	if exists( "g:vim_local['local_bundles']" )
		if !exists( "g:vim_local['vardata']" )
			echo "Local bundles requested, but local data directory is not set."
		endif
		let g:bundles_dir = GetVardataPath( "bundles" )
	else
		let g:bundles_dir = g:vim_vardata . "/bundles/"
	endif
endif

if g:bundles_dir !~ "/$"
	let g:bundles_dir = g:bundles_dir . "/"
endif
if !CreateDirectoryIfNecessary( g:bundles_dir )
	unlet g:bundles_dir
	function! DoNeoBundleCheck()
		" Empty placeholder function
	endfunction
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

" Load all plugins from bundles-init/*.load.vim
let s:binit_dir = g:vim_home . "/bundles-init"
let s:bundle_load_files = GetConfigFiles( "bundles-init" , "*.load.vim" )
for s:plfn in values( s:bundle_load_files )
	execute "source" s:plfn

	" Create configuration loading hooks
	let s:pname = fnamemodify( s:plfn , ":t:r:r" )
	let s:bundle = neobundle#get( s:pname )
	if empty( s:bundle )
		continue
	endif

	function! s:bundle.hooks.on_post_source( bundle )
		let cfgfile = GetConfigFilePath( "bundles-init" ,
			\ a:bundle.name . ".cfg.vim" )
		if l:cfgfile != ""
			execute "source" l:cfgfile
		endif
	endfunction
endfor

call neobundle#end()

function! DoNeoBundleCheck()
	" Let NeoBundle check for installations
	NeoBundleCheck
	call neobundle#call_hook( "on_post_source" )
endfunction
