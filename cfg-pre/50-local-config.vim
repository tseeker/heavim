" Attempt to find a local configuration or configuration directory

" Clear various things that could be here from a previous execution
unlet! g:vim_local
unlet! g:vim_local_path
command! -bang -nargs=* SaveAndSign echoerr "Command not supported"
command! -bang -nargs=* SignConfig echoerr "Command not supported"

" Clear configuration signing autocommands
augroup LocalConfigurationSigning
	autocmd!
augroup END

" Always define this function; it tries to access data from either g:vim_local
" if that is defined, or from a global variable otherwise
function! GetConfigValue(name,...)
	if exists( "g:vim_local['" . a:name . "']" )
		return g:vim_local[ a:name ]
	endif
	if exists( "g:" . a:name )
		execute "return g:" . a:name
	endif
	return a:1
endfunction

" Get a vardata path, either from the local configuration or from
" g:vim_vardata.
function! GetVardataPath(name)
	if exists( "g:vim_local['vardata']" )
		return g:vim_local['vardata'] . "/" . a:name
	endif
	return g:vim_vardata . "/" . a:name
endfunction

" Find a configuration file, based on a path relative to the configuration
" directory and a name.
"
" 1/ If there is a local configuration, this will look for the file in the
"    local configuration. If it exists, its full path will be returned.
" 2/ If there is a local configuration, this will look for a file named
"    'suppress.<name>' at the same location; if the file is found, the
"    function will return an empty string.
" 3/ If the file exists in the global configuration, its full path will be
"    returned.
" 4/ An empty string will be returned.
function! GetConfigFilePath(base,name)
	if exists( "g:vim_local_path" )
		let bd = g:vim_local_path . "/" . a:base
		if filereadable( l:bd . "/" . a:name )
			return l:bd . "/" . a:name
		endif
		if filereadable( l:bd . "/suppress." . a:name )
			return ""
		endif
	endif
	let f = g:vim_home . "/" . a:base . "/" . a:name
	if filereadable( l:f )
		return l:f
	endif
	return ''
endfunction

" List files in a configuration directory, letting the local configuration
" override the main configuration. The files are returned as a dictionary;
" keys are the files' basenames, while values are the full paths.
function! GetConfigFiles(base,pattern)
	let fd = {}
	" Get main configuration files
	for mcf in glob( g:vim_home . "/" . a:base . "/" . a:pattern , 1 , 1 )
		let l:fd[ fnamemodify( l:mcf , ":t" ) ] = l:mcf
	endfor
	" Exit if there's no local configuration
	if !exists( "g:vim_local_path" )
		return l:fd
	endif
	" Handle suppressions
	for lsf in glob( g:vim_local_path . "/" . a:base . "/suppress." . a:pattern , 1 , 1 )
		unlet! l:fd[ fnamemodify( l:lsf , ":t" )[ 9 : -1 ] ]
	endfor
	" Handle local files
	for lcf in glob( g:vim_local_path . "/" . a:base . "/" . a:pattern , 1 , 1 )
		let name = fnamemodify( l:lcf , ":t" )
		if name !~ "^suppress\\."
			let l:fd[ l:name ] = l:lcf
		endif
	endfor
	return l:fd
endfunction


" We need signature handling abilities to continue
if !exists( "g:vim_keys" )
	finish
endif

" When a .vim.local/vimrc file is saved,  print a warning about the lack of
" signature.
function! <SID>WarnAboutSignature()
	let bp = expand( "%:p:h" )
	if fnamemodify( bp , ":t" ) == ".vim.local"
		if exists( "g:vim_local_path" )
			let bp = l:bp . "/"
			if g:vim_local_path =~ "/$" && l:bp !~ "/$"
				let l:bp = l:bp . "/"
			elseif g:vim_local_path !~ "/$" && l:bp =~ "/$"
				let l:bp = l:bp[ 0 : -2 ]
			endif
		endif

		" If we're being called from SaveAndSign, sign it instead of
		" whining.
		if exists( "s:save_and_sign" )
			call SignFile( expand( "%:p" ) , l:bp . "/signature" )
			return
		endif

		echohl WarningMsg
		if exists( "g:vim_local_path" ) && g:vim_local_path == l:bp
			echo "Warning: not signed, use :SignConfig"
		else
			echo "Warning: not signed, use :SaveAndSign."
		endif
		echohl None
	endif
endfunction

augroup LocalConfigurationSigning
	autocmd BufWritePost vimrc :call <SID>WarnAboutSignature()
augroup END

" Sign the local configuration file; only works when one has already been
" loaded.
function! <SID>SignConfig()
	if exists( "g:vim_local_path" ) && filereadable( g:vim_local_path . "/vimrc" )
		call SignFile( g:vim_local_path . "/vimrc" ,
			     \ g:vim_local_path . "/signature" )
	elseif exists( "g:vim_local_path" )
		echohl ErrorMsg
		echo "ERROR: no local vimrc file"
		echohl None
	else
		echohl ErrorMsg
		echo "ERROR: no local configuration; use :SaveAndSign for new configurations"
		echohl None
	endif
endfunction
command! SignConfig :call <SID>SignConfig()

" Save and sign a local configuration file. Can be used with both active local
" configurations and new or external configurations.
function! <SID>SaveAndSign(force,...)
	if a:0 > 1
		echohl ErrorMsg
		echo "E172: Only one file name allowed"
		echohl None
		return
	endif
	let s:save_and_sign = 1
	if a:0 == 1 && a:force
		execute "w!" a:1
	elseif a:0
		execute "w" a:1
	elseif a:force
		w!
	else
		w
	endif
	unlet! s:save_and_sign
endfunction
command! -bang -complete=file -nargs=? SaveAndSign
	\ call <SID>SaveAndSign( "<bang>" == "!" , <f-args> )


" Check if the local directory and local vimrc exist
if !( isdirectory( ".vim.local" ) && filereadable( ".vim.local/vimrc" ) )
	finish
endif
echo " "
echo "Found local configuration in .vim.local ; validating..."

" Verify the vimrc's signature
try
	call CheckSignature( ".vim.local/vimrc" , ".vim.local/signature" )
catch /.*/
	echohl ErrorMsg
	echo " "
	echo " -> SIGNATURE VERIFICATION FAILED"
	echo " "
	echohl None
	finish
endtry
echo " -> Using local configuration."
echo " "

let g:vim_local_path = fnamemodify( ".vim.local" , ":p" )
let &g:runtimepath = &g:runtimepath . "," . g:vim_local_path

" Source it
source .vim.local/vimrc
