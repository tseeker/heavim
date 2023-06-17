" Load and initialise Dein and plugins

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
	function! CheckDeinInstall()
		" Empty placeholder function
	endfunction
	finish
endif

if has( 'vim_starting' )
	if &compatible
		set nocompatible
	endif

	let s:dein_path = g:bundles_dir . "github.com/Shougo/dein.vim"
	if !isdirectory(s:dein_path)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_path
	endif
	let &g:runtimepath = &g:runtimepath . "," . s:dein_path
endif

call dein#begin( g:bundles_dir )

" Load Dein itself
call dein#add(s:dein_path)

" Load all plugins from ${plugins directory}/*.load.vim
let s:plugins_dir = "plugins"
let s:binit_dir = g:vim_home . "/" . s:plugins_dir
let s:bundle_load_files = GetConfigFiles( s:plugins_dir , "*.load.vim" )
for s:plfn in values( s:bundle_load_files )
	execute "source" s:plfn

	" Create configuration loading hooks
	let s:pname = fnamemodify( s:plfn , ":t:r:r" )
	let s:bundle = dein#get( s:pname )
	if empty( s:bundle )
		continue
	endif

	function! s:bundle.hooks.on_post_source( bundle )
		let cfgfile = GetConfigFilePath( s:plugins_dir ,
			\ a:bundle.name . ".cfg.vim" )
		if l:cfgfile != ""
			execute "source" l:cfgfile
		endif
	endfunction
endfor

call dein#end()

function! CheckDeinInstall()
	" Let Dein check for installations
	if dein#check_install()
		call dein#install()
	endif
	call dein#call_hook( "on_post_source" )
endfunction
