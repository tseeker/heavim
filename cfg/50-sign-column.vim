" Sign column color and visibility
let s:sc_modes = {
\	'no' : 'yes' ,
\       'yes' : 'no' ,
\       }

function! <SID>ToggleSignColumn()
	let &signcolumn = s:sc_modes[ &g:signcolumn ]
endfunction

highlight SignColumn ctermfg=15 ctermbg=234
set signcolumn=yes
nmap <silent> <leader>os :call <SID>ToggleSignColumn()<cr>
