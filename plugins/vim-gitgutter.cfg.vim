" Function that generates the list of hunks and opens the quickfix window
function! ShowGitGutterQuickfix()
	exe "GitGutterQuickFix"
	call ToggleQuickfix(0, 1)
endfunction

" Function that toggles the hunk preview window.
function! ToggleHunkPreviewWindow()
	if gitgutter#hunk#is_preview_window_open()
		call gitgutter#hunk#close_hunk_preview_window()
	else
		exe "GitGutterPreviewHunk"
	endif
endfunction

" Don't register default key mappings
let g:gitgutter_map_keys = 0

" Keyboard mappings.
nnoremap <silent> <Leader>g< :GitGutterPrevHunk<cr>
nnoremap <silent> <Leader>g> :GitGutterNextHunk<cr>
nnoremap <silent> <Leader>g+ :GitGutterStageHunk<cr>
nnoremap <silent> <Leader>g- :GitGutterUndoHunk<cr>
nnoremap <silent> <Leader>gq :call ShowGitGutterQuickfix()<cr>
nnoremap <silent> <Leader>g* :call ToggleHunkPreviewWindow()<cr>

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
