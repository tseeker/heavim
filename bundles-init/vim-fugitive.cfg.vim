" Fugitive commands that don't require interaction with GitGutter or NERDTree
nnoremap <silent> <Leader>ga :Git add %:p<cr>
nnoremap <silent> <Leader>gd :Gdiffsplit<cr>
nnoremap <silent> <Leader>gs :Git<cr>
nnoremap <silent> <Leader>gc :Git commit -q<cr>
nnoremap <Leader>gb :Git branch<space>

" Note: dangerous commands don't have a <cr>
nnoremap <Leader>gB :Git checkout -b<space>
nnoremap <Leader>gC :Git checkout<space>
nnoremap <Leader>gM :GMove<space>
nnoremap <Leader>gp :Git pull --recurse-submodules<space>
nnoremap <Leader>gP :Git push<space>
nnoremap <Leader>gR :GRemove
