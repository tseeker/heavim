call dein#add('scrooloose/nerdtree', #{
	\	lazy: 1,
	\	on_cmd: [ 'NERDTree', 'NERDTreeToggle' ],
	\ })

nnoremap <Leader>e :NERDTreeToggle<CR>
