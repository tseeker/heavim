call dein#add('vim-test/vim-test', #{
	\	lazy: 1,
	\	on_cmd: [
	\		'TestSuite', 'TestFile', 'TestNearest', 'TestLast',
	\		'TestVisit', 'TestClass',
	\	],
	\ })

" Shortcuts
nmap <silent> <Leader>Ta :TestSuite<CR>
nmap <silent> <Leader>Tf :TestFile<CR>
nmap <silent> <Leader>Tc :TestNearest<CR>
nmap <silent> <Leader>TT :TestLast<CR>

" Run tests in the background, send results to the quickfix window
" NOTE: this must be set in this file, not in a .cfg / .post file
let test#strategy = 'asyncrun_background'
