" Trailing spaces and visible tabs
"
" Trailing spaces are visible in normal or visual mode, but hidden in insert
" mode. Tabs can be displayed or hidden using <Leader>T.

set list
set listchars=""
set listchars+=trail:•
set listchars+=tab:\ \ 
let s:VisibleTabs = 0

function! s:UpdateListChars(type,value)
	let lc = filter( split( &l:listchars , "," ) , "v:val !~ '^" . a:type . ":'" ) + [ a:type . ":" . a:value ]
	let &l:listchars = join( lc , "," )
endfunction

function! <SID>SwitchVisibleTabs()
	if s:VisibleTabs == 1
		let s:VisibleTabs = 0
		call s:UpdateListChars( "tab" , "  " )
	else
		let s:VisibleTabs = 1
		call s:UpdateListChars( "tab" , "» " )
	endif
endfunction

nnoremap <silent> <Leader>T :call <SID>SwitchVisibleTabs()<cr>
augroup TrailingWhitespace
	autocmd!
	autocmd InsertEnter * :call <SID>UpdateListChars( "trail" , " " )
	autocmd InsertLeave * :call <SID>UpdateListChars( "trail" , "•" )
augroup END
