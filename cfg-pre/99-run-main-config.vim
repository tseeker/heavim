" Loads the main configuration from cfg/, using a merge from the main and
" local configurations.

let s:cfg_files = GetConfigFiles( "cfg" , "??-?*.vim" )
for s:cfg_file in sort( keys( s:cfg_files ) )
	execute 'source ' . s:cfg_files[ s:cfg_file ]
endfor
