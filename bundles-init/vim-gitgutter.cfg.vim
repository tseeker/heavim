" Key maps
let g:gitgutter_map_keys = 0
nnoremap <silent> <Leader>g< :GitGutterPrevHunk<cr>
nnoremap <silent> <Leader>g> :GitGutterNextHunk<cr>
nnoremap <silent> <Leader>g+ :GitGutterStageHunk<cr>
nnoremap <Leader>g- :GitGutterRevertHunk

" Symbols
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '±'
let g:gitgutter_sign_removed = '∅'

" Symbol colors
highlight GitGutterAdd ctermfg=10 ctermbg=236
highlight GitGutterChange ctermfg=11 ctermbg=236
highlight GitGutterDelete ctermfg=9 ctermbg=236 cterm=bold

" No highlights for added/changed/deleted lines
highlight GitGutterAddLine ctermbg=0
highlight GitGutterChangeLine ctermbg=0
highlight GitGutterDeleteLine ctermbg=0
highlight GitGutterChangeDeleteLine ctermbg=0
