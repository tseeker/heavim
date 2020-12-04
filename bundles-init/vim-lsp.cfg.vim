" Highlight references
let g:lsp_highlight_references_enabled = 1
highlight lspReference cterm=bold,italic ctermfg=148 ctermbg=0

" Error/warning signs
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}

" Keyboard shortcuts
noremap <Leader>df :LspDocumentFormat<cr>
vnoremap <Leader>df :LspDocumentRangeFormat<cr>
noremap <Leader>dr :LspReferences<cr>
noremap <F3> :LspDefinition<cr>
noremap <Leader>dR :LspRename<cr>
noremap <Leader>dh :LspHover<cr>
noremap <Leader>ds :LspWorkspaceSymbol<cr>
