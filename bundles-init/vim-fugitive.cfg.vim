" Fugitive commands that don't require interaction with GitGutter or NERDTree
nnoremap <silent> <Leader>gd :Gdiff<cr>
nnoremap <silent> <Leader>gs :Gstatus<cr>
nnoremap <silent> <Leader>gc :Gcommit -q<cr>
nnoremap <Leader>gb :Git branch<space>

" Note: dangerous commands don't have a <cr>
nnoremap <Leader>gB :Git checkout -b<space>
nnoremap <Leader>gC :Git checkout<space>
nnoremap <Leader>gM :Gmove<space>
nnoremap <Leader>gP :Git push<space>
nnoremap <Leader>gR :Gremove
