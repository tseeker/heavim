" Don't display useless columns in the Git status window
autocmd FileType fugitive setlocal signcolumn=no nonumber norelativenumber

" Timeouts need to be disabled in the Git status window. We need to switch
" them off when entering it, and on when leaving it.
let s:in_fugitive_buffer = v:false
autocmd BufEnter *
	\   if &ft ==# 'fugitive'
	\ |	set notimeout
	\ |	let s:in_fugitive_buffer = v:true
	\ | endif
autocmd BufLeave *
	\   if s:in_fugitive_buffer
	\ |	let s:in_fugitive_buffer = v:false
	\ |	set timeout
	\ | endif
