" Highlight references
let g:lsp_highlight_references_enabled = 1
highlight lspReference cterm=bold,italic ctermfg=148 ctermbg=0

" Error/warning signs
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}

" Keyboard shortcuts
noremap <Leader>ld :LspDocumentDiagnostics<cr>
noremap <Leader>lf :LspDocumentFormat<cr>
noremap <Leader>lgd :LspDefinition<cr>
noremap <Leader>lgD :LspDeclaration<cr>
noremap <Leader>li :LspHover<cr>
noremap <Leader>lr :LspReferences<cr>
noremap <Leader>lR :LspRename<cr>
noremap <Leader>ls :LspDocumentSymbol<cr>
noremap <Leader>lS :LspWorkspaceSymbol<cr>
