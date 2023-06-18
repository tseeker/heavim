" NERDTree: ' e' = toggle side bar
let g:NERDTreeGitStatusUpdateOnWrite = 1
nnoremap <Leader>e :NERDTreeToggle<CR>

" Set the bookmarks file's path
let g:NERDTreeBookmarksFile = GetVardataPath( 'NTBookmarks' )

" Hide Python cache directories
let g:NERDTreeIgnore=['^__pycache__$']

" Hide the sign column
autocmd FileType nerdtree setlocal signcolumn=no
