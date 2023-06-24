call dein#add('wsdjeg/dein-ui.vim', #{
	\	lazy: 1,
	\	on_cmd: ['DeinUpdate'],
	\ })

" Add key mappings for updates and installation
nnoremap <silent> <Leader>Pu :DeinUpdate<cr>
nnoremap <silent> <Leader>Pi :call CheckDeinInstall()<cr>
