" Keys to control (actual) tabs
nnoremap <silent> <A-Insert> :tabnew<CR>
nnoremap <silent> <C-A-Insert> :tabclose<CR>
nnoremap <silent> <A-Left> :tabprevious<CR>
nnoremap <silent> <A-Right> :tabnext<CR>
nnoremap <silent> <A-Up> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Down> :execute 'silent! tabmove ' . tabpagenr()<CR>
