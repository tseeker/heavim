" Run tests in the background, send results to the quickfix window
let test#strategy = 'async_background'

" Shortcuts
nmap <silent> <F10> :TestSuite<CR>
nmap <silent> <F11> :TestFile<CR>
nmap <silent> <S-F11> :TestNearest<CR>
nmap <silent> <C-F11> :TestLast<CR>
