" Make sure :Man is loaded, and map it. Also, remove the default mapping.
if exists( ':Man' ) != 2
	source $VIMRUNTIME/ftplugin/man.vim
endif
unmap <Leader>K
nnoremap <Leader>hm :Man <cword><cr>
