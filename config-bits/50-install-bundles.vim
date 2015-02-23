" Force NeoBundle to check the loaded plugins and install them

function! DoNeoBundleCheck()
	" Save current filetype settings
	let s:has_ft = exists( "g:did_load_filetypes" )
	let s:has_fti = exists( "g:did_indent_on" )
	let s:has_ftp = exists( "g:did_load_ftplugin" )

	" Enable filetype with both indent and plugins
	if !( s:has_ft && s:has_fti && s:has_ftp )
		filetype plugin indent on
	endif

	" Let NeoBundle check for installations
	NeoBundleCheck

	" Call hooks on reload
	if !has( "vim_starting" )
		call neobundle#call_hook( "on_post_source" )
	endif

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
endfunction

call DoNeoBundleCheck( )

" Do mappings somewhere else
" nmap <silent> <S-F12> :NeoBundleCheckUpdate<cr>
" nmap <silent> <C-F12> :call DoNeoBundleCheck()<cr>
