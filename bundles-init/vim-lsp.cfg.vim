let g:lsp_highlight_references_enabled = 1
highlight lspReference ctermfg=black guifg=black ctermbg=yellow guibg=yellow

let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}

noremap <Leader>df :LspDocumentFormat<cr>
vnoremap <Leader>df :LspDocumentRangeFormat<cr>
noremap <Leader>dr :LspReferences<cr>
noremap <F3> :LspDefinition<cr>
noremap <Leader>dR :LspRename<cr>
noremap <Leader>dh :LspHover<cr>
noremap <Leader>ds :LspWorkspaceSymbol<cr>

"-----------------------------
" CONFIGURE VARIOUS SERVERS
"-----------------------------

" Rust
if executable('rustup')
	au User lsp_setup call lsp#register_server({
		\ 'name': 'rust' ,
		\ 'cmd' : {server_info->[
			\ &shell,
			\ &shellcmdflag,
			\ 'rustup run stable rls']
		\ } ,
		\ 'whitelist' : [ 'rust' ] ,
	\ })
endif

" Python (requires pip install python-language-server)
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif
