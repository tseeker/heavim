" Force NeoBundle to check the loaded plugins and install them

" Save current filetype settings
let s:has_ft = exists( "did_load_filetypes" )
let s:has_fti = exists( "did_indent_on" )
let s:has_ftp = exists( "did_load_ftplugin" )

" Enable filetype with both indent and plugins
if !( s:has_ft && s:has_fti && s:has_ftp )
	filetype plugin indent on
endif

" Let NeoBundle check for installations
NeoBundleCheck

" Call hooks on reload
if !has( "vim_starting" )
	call neobundle#call_hook( "on_source" )
endif

" Load configuration files for all installed plugins
let s:binit_dir = g:vim_home . "/bundles-init"
for s:pcfn in glob( s:binit_dir . "/*.cfg.vim" , 0 , 1 )
	let s:pname = fnamemodify( s:pcfn , ":t:r:r" )
	if neobundle#is_installed( s:pname )
		execute "source" s:pcfn
	endif
endfor

" Restore filetype settings
if ! s:has_fti
	filetype indent off
endif
if ! s:has_ftp
	filetype plugin off
endif
if ! s:has_ft
	filetype off
endif
