" Attempt to find a local configuration or configuration directory

" Clear various things that could be here from a previous execution
if exists( "g:vim_local" )
	unlet g:vim_local
endif
if exists( "g:vim_local_path" )
	unlet g:vim_local_path
endif
if exists( "*CheckAndSignLocalVimrc" )
	function! CheckAndSignLocalVimrc(fname)
	endfunction
endif
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

" We need signature handling abilities for that
if !exists( "g:vim_keys" )
	finish
endif

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
	echo " "
	echo " -> SIGNATURE VERIFICATION FAILED"
	echo " "
	finish
endtry
echo " -> Using local configuration."
echo " "
let g:vim_local_path = fnamemodify( ".vim.local" , ":p" )

" Source it
source .vim.local/vimrc
