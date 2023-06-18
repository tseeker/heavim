call dein#add('tpope/vim-fugitive', #{
	\	lazy: 1,
	\	on_cmd: [ 'Git', 'Gvdiffsplit', 'GMove', 'GRename', 'GRemove' ],
	\ })

" Fugitive commands that don't require interaction with GitGutter or NERDTree
nnoremap <silent> <Leader>ga :Git add %:p<cr>
nnoremap <silent> <Leader>gd :Gvdiffsplit<cr>
nnoremap <silent> <Leader>gs :Git<cr>
nnoremap <silent> <Leader>gc :Git commit -q<cr>
nnoremap <silent> <Leader>gz :Git reset %:p<cr>
nnoremap <Leader>gb :Git branch<space>
nnoremap <Leader>gP :Git! push<cr>

" Note: dangerous commands don't have a <cr>. Also commands that need
" arguments, obviously.
nnoremap <Leader>gB :Git checkout -b<space>
nnoremap <Leader>gC :Git checkout<space>
nnoremap <Leader>gM :GMove<space>
nnoremap <Leader>gp :Git pull --recurse-submodules<space>
nnoremap <Leader>gr :GRename<space>
nnoremap <Leader>gR :GRemove
