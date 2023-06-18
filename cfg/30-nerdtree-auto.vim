" Open automatically NERDTree if there are more than 150 columns and no file was
" specified
autocmd VimEnter * if argc() == 0 && &columns > 150
	\	| call dein#source("nerdtree")
	\	| NERDTree
	\ | endif
