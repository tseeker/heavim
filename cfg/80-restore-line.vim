" Return to last edited line when a file is re-opened
augroup RememberLine
	autocmd!
	autocmd BufReadPost *
		\ if line( "'\"" ) > 0 && line( "'\"" ) <= line( "$" )
		\		&& &filetype != "svn"
		\		&& &filetype != "gitcommit"
		\		&& &filetype != "gitrebase"
		\		&& &filetype != "hgcommit"
		\		&& &filetype != "cvs" |
		\	execute 'normal! g`"zvzz' |
		\ endif
augroup END
