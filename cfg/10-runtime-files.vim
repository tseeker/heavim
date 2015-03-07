" viminfo file
if &g:viminfo !~ ",n"
	let s:viminfo_path = GetVardataPath( "viminfo" )
	let &g:viminfo = &g:viminfo . ",n" . s:viminfo_path
	if filereadable( s:viminfo_path )
		rviminfo
	endif
endif

" Undo file, if active
if &g:undofile
	let s:undo_path = GetVardataPath( "undo" )
	if CreateDirectoryIfNecessary( s:undo_path )
		let &g:undodir = s:undo_path
	else
		echoerr "could not create " . s:undo_path
		set noundodir
	endif
endif

" Swap directory
if &g:swapfile
	let s:swap_path = GetVardataPath( "swap" )
	if CreateDirectoryIfNecessary( s:swap_path )
		let &g:directory = s:swap_path
	else
		echoerr "could not create " . s:swap_path
		set noswapfile
	endif
endif

" Backup directory
if &g:backup
	let s:backup_path = GetVardataPath( "backup" )
	if CreateDirectoryIfNecessary( s:backup_path )
		let &g:backupdir = s:backup_path
	else
		echoerr "could not create " . s:backup_path
		set nobackup
	endif
endif
