" Force NeoBundle to check the loaded plugins and install them

call DoNeoBundleCheck( )

" Add key mappings for updates and installation
nnoremap <silent> <Leader>Bu :NeoBundleCheckUpdate<cr>
nnoremap <silent> <Leader>Bi :call DoNeoBundleCheck()<cr>
