call dein#add('mbbill/undotree', #{
	\	lazy: 1 ,
	\	on_cmd: [ 'UndotreeShow', 'UndotreeToggle' ],
	\ })

nnoremap <Leader>u :UndotreeToggle<CR>
