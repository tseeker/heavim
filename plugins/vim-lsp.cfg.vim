" Highlight references
let g:lsp_highlight_references_enabled = 1
highlight lspReference cterm=bold,italic ctermfg=148 ctermbg=0

" Error/warning signs
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_signs_error = {'text': '✗'}
let g:lsp_diagnostics_signs_warning = {'text': '‼'}

" "Virtual" text right in the middle of the code? hell no.
let g:lsp_diagnostics_virtual_text_enabled = 0

" Keyboard shortcuts
noremap <Leader>lR :LspRename<cr>
noremap <Leader>lS :LspWorkspaceSymbol<cr>
noremap <Leader>la :LspCodeAction<cr>
noremap <Leader>ld :LspDocumentDiagnostics<cr>
noremap <Leader>lf :LspDocumentFormat<cr>
noremap <Leader>lgD :LspDeclaration<cr>
noremap <Leader>lgd :LspDefinition<cr>
noremap <Leader>li :LspHover<cr>
noremap <Leader>lr :LspReferences<cr>
noremap <Leader>ls :LspDocumentSymbol<cr>
