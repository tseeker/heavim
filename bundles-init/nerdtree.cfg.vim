" NERDTree: ' e' = toggle side bar
let g:NERDTreeUpdateOnWrite = 1
nnoremap <Leader>e :NERDTreeToggle<CR>

" Open automatically if there are more than 150 columns and no file was specified
autocmd VimEnter * if argc() == 0 && &columns > 150 | NERDTree | endif
