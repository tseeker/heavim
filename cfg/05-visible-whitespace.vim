" Trailing spaces and visible tabs
"
" Trailing spaces are visible in normal or visual mode, but hidden in insert
" mode. All whitespace can be made visible using <Leader>ow

let s:Settings = {
\	'tab'   : [ "  " , "» " ] ,
\	'nbsp'  : [ " " ,  "⚠"  ] ,
\	'space' : [ " " ,  "·"  ] ,
\	'eol'   : [ " " ,  "¶"  ] ,
\	}
let s:VisibleTabs = 0

function! s:UpdateListChars(type,value)
	let lc = filter( split( &l:listchars , "," ) , "v:val !~ '^" . a:type . ":'" ) + [ a:type . ":" . a:value ]
	let &l:listchars = join( lc , "," )
endfunction

function! s:ApplyWhitespaceSettings()
	for k in keys(s:Settings)
		call s:UpdateListChars( k , s:Settings[k][s:VisibleTabs] )
	endfor
endfunction

function! <SID>ToggleVisibleWhitespace()
	let s:VisibleTabs = 1 - s:VisibleTabs
	call s:ApplyWhitespaceSettings()
endfunction

set list
set listchars=""
call s:ApplyWhitespaceSettings()

nnoremap <silent> <Leader>ow :call <SID>ToggleVisibleWhitespace()<cr>
augroup TrailingWhitespace
	autocmd!
	autocmd InsertEnter * :call <SID>UpdateListChars( "trail" , " " )
	autocmd InsertLeave * :call <SID>UpdateListChars( "trail" , "•" )
augroup END
