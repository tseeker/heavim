" Force Dein to check the loaded plugins and install them
call CheckDeinInstall( )

" Add key mappings for updates and installation
nnoremap <silent> <Leader>Pu :DeinUpdate<cr>
nnoremap <silent> <Leader>Pi :call CheckDeinInstall()<cr>
