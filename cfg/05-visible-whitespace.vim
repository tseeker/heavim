" Trailing spaces and visible tabs
"
" Trailing spaces are visible in normal or visual mode, but hidden in insert
" mode. All whitespace can be made visible using <Leader>ow

let s:VisibleWhitespace = 0
let s:VisibleTrail = 1

function! s:UpdateListChars()
	if s:VisibleWhitespace
		set listchars=tab:»\ ,nbsp:⚠,space:·,eol:¶
	else
		set listchars=tab:\ \ ,
	endif
	if s:VisibleTrail
		set listchars+=trail:•
	endif
endfunction

function! s:ToggleWhitespace()
	let s:VisibleWhitespace = 1 - s:VisibleWhitespace
	call s:UpdateListChars()
endfunction

function! s:SetVisibleTrail(trail)
	let s:VisibleTrail = a:trail
	call s:UpdateListChars()
endfunction

set list
call s:UpdateListChars()
nnoremap <silent> <Leader>ow :call <SID>ToggleWhitespace()<cr>

augroup TrailingWhitespace
	autocmd!
	autocmd InsertEnter * :call <SID>SetVisibleTrail(0)
	autocmd InsertLeave * :call <SID>SetVisibleTrail(1)
augroup END
