" Manage keys used for signing local configuration files
"
" * Can be disabled completely by setting VIM_NOCRYPTO in the environment
" * Will disable itself silently if openssl is unavailable
" * Keys will be looked up in g:vim_vardata/keys by default, unless
"   g:vim_keys is set


" Register no-operation functions for signing and checking signatures

function! SignFile(filename,sigfile)
	if !empty( glob( a:sigfile ) )
		call delete( a:sigfile )
	endif
	return 0
endfunction

function! CheckSignature(filename,sigfile)
	echoerr "Signature checking is disabled."
	return 0
endfunction


" Get configured directory / use default. Make sure global configuration
" is cleared.
if exists( "g:vim_keys" )
	if $VIM_NOCRYPTO == ""
		let s:keys_dir = g:vim_keys
	endif
	unlet g:vim_keys
elseif $VIM_NOCRYPTO == "" && g:vim_vardata != ""
	let s:keys_dir = g:vim_vardata . "/keys"
endif
if !exists( "s:keys_dir" ) || !executable( "openssl" ) || !has( "cryptv" )
	finish
endif

" Try creating the directory
if ! CreateDirectoryIfNecessary( s:keys_dir )
	echoerr "Could not create" s:keys_dir
		\ "; signed configuration support disabled"
	finish
endif

" Create the key if necessary
if !filereadable( s:keys_dir . "/vim.key" )
	let s:key_bits = exists( "g:vim_key_bits" ) ? g:vim_key_bits : 4096
	echo "Generating configuration signing key (" . s:key_bits
		\ . " bits)..."
	let s:genrsa = system( "openssl genrsa -out "
		\ . shellescape( s:keys_dir . "/vim.key" )
		\ . " " . s:key_bits . " >/dev/null 2>&1; echo $?" )
	if s:genrsa
		echoerr "Key generation failed!"
		finish
	endif
endif

" Set global configuration variable and define actual signature functions
let g:vim_keys = s:keys_dir

function! SignFile(filename,sigfile)
	if !empty( glob( a:sigfile ) )
		if delete( a:sigfile )
			echoerr "Could not delete old signature file"
				\ a:sigfile
			return 0
		endif
	endif
	
	" Load the file
	if !filereadable( a:filename )
		echoerr "File" a:filename "is not readable"
		return 0
	endif
	try
		let file_contents = readfile( a:filename , "b" )
	catch /.*/
		echoerr "Could not load" a:filename
		return 0
	endtry

	" Compute checksum
	let checksum = sha256( join( l:file_contents , "\n" ) )

	" Sign and store checksum
	let command = "echo " . l:checksum
		\ . " | openssl rsautl -sign -inkey "
		\ . shellescape( g:vim_keys . "/vim.key" )
		\ . " -out " . shellescape( a:sigfile )
		\ . " >/dev/null 2>&1; echo $?"
	let rv = system( l:command )
	if l:rv
		echoerr "Signature failed for" a:filename
		echoerr "Command was:" l:command
	endif
	return !l:rv
endfunction

function! CheckSignature(filename,sigfile)
	let signed_sum = system( "openssl rsautl -verify -inkey "
		\ . shellescape( g:vim_keys . "/vim.key" )
		\ . " -in " . shellescape( a:sigfile )
		\ . " 2>/dev/null" )
	if signed_sum == ""
		echoerr "Signature verification failed for" a:filename
		return 0
	endif

	" Load the file
	try
		let file_contents = readfile( a:filename , "b" )
	catch /.*/
		echoerr "Could not load" a:filename
		return 0
	endtry

	" Verify checksum
	let computed = sha256( join( l:file_contents , "\n" ) )
	if len( l:signed_sum ) > len( l:computed )
		let l:signed_sum = l:signed_sum[ 0 : len( l:computed ) - 1 ]
	endif
	if l:computed != l:signed_sum
		echoerr "Checksum mismatch for" a:filename
		return 0
	endif
	return 1
endfunction
