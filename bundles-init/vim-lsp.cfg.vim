au User lsp_setup call lsp#register_server({
	\ 'name': 'rust' ,
	\ 'cmd' : {server_info->[
		\ &shell,
		\ &shellcmdflag,
		\ 'rustup run stable rls']
	\ } ,
	\ 'whitelist' : [ 'rust' ] ,
\ })

noremap <Leader>df :LspDocumentFormat<cr>
vnoremap <Leader>df :LspDocumentRangeFormat<cr>
noremap <Leader>dr :LspReferences<cr>
noremap <F3> :LspDefinition<cr>
noremap <Leader>dR :LspRename<cr>
noremap <Leader>dh :LspHover<cr>
noremap <Leader>ds :LspWorkspaceSymbol<cr>
