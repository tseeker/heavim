" Extra syntax
" Make
let g:tagbar_type_make = {
	\ 'kinds':[
		\ 'm:macros',
		\ 't:targets'
	\ ]
\ }

nnoremap <silent> <Leader>t :Tagbar<CR>
autocmd VimEnter * if argc() > 0 && &columns > 150 | execute "Tagbar" | endif
