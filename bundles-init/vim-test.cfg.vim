" Run tests in the background, send results to the quickfix window
let test#strategy = 'asyncrun_background'

" Shortcuts
nmap <silent> <Leader>Ta :TestSuite<CR>
nmap <silent> <Leader>Tf :TestFile<CR>
nmap <silent> <Leader>Tc :TestNearest<CR>
nmap <silent> <Leader>TT :TestLast<CR>
