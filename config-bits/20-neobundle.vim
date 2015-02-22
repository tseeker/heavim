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

" Load NeoBundle itself, as well as VimProc
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
	\ 'build' : {
	\     'windows' : 'tools\\update-dll-mingw',
	\     'cygwin' : 'make -f make_cygwin.mak',
	\     'mac' : 'make -f make_mac.mak',
	\     'linux' : 'make',
	\     'unix' : 'gmake',
	\    },
	\ }

" Load all plugins from bundles-init/*.load
let s:binit_dir = g:vim_home . "/bundles-init"
for s:plfn in glob( s:binit_dir . "/*.load.vim" , 0 , 1 )
	execute "source" s:plfn
endfor

call neobundle#end()
