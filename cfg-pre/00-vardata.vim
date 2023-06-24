" Variable data directory handling

" Create a directory if it doesn't already exist
function! CreateDirectoryIfNecessary( name )
	if isdirectory( a:name )
		if !filewritable( a:name )
			echoerr "Directory" a:name "is not writable"
			return 0
		endif
		return 1
	endif

	if !empty( glob( a:name ) )
		echoerr a:name "exists but is not a directory"
		return 0
	endif

	if exists( "*mkdir" )
		return mkdir( a:name , "p" , 0700 )
	endif

	let rv = system( "mkdir -p -m 0700 " . shellescape( a:name )
		\ . " >/dev/null 2>&1; echo $?" )
	if l:rv
		echoerr "Cannot create" a:name
	endif
	return !rv
endfunction

" Get it from either g:vim_vardata, $VIM_DATA or create it based on $HOME
if exists( 'g:vim_vardata' )
	let s:vim_vardata_base = g:vim_vardata
elseif $VIM_DATA != ""
	let s:vim_vardata_base = $VIM_DATA
else
	let s:vim_vardata_base = $HOME . '/.cache/vim'
endif

" Remove trailing slash
if s:vim_vardata_base =~ "/$"
	let s:vim_vardata_base = s:vim_vardata_base[ 0 : -1 ]
endif

" Attempt creating it
if CreateDirectoryIfNecessary( s:vim_vardata_base )
	let g:vim_vardata = glob( s:vim_vardata_base )
else
	let g:vim_vardata = ''
endif

