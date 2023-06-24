call dein#add('rbong/vim-flog', #{
	\	lazy: 1,
	\	merge_ftdetect: v:true,
	\	on_cmd: ['Flog', 'Flogsplit'],
	\ })

" Key mappings
nmap <leader>gL :Flog<cr>
nmap <leader>gl :Flogsplit<cr>
