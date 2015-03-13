" Make sure :Man is loaded, and map it.

if exists( ':Man' ) != 2
	source $VIMRUNTIME/ftplugin/man.vim
endif

nnoremap <Leader>hm :Man <cword><cr>
