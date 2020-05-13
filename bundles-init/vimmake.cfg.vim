"if exists( 'g:vim_local_path' )
"	let g:vimmake_path = g:vim_local_path . 'scripts'
"
"	let g:vimmake_mode = {}
"	let g:vimmake_mode['clean'] = 'async'
"	let g:vimmake_mode['build'] = 'async'
"	let g:vimmake_mode['rebuild'] = 'async'
"	let g:vimmake_mode['test'] = 'async'
"
"	function! DoBuild(full)
"		silent call vimmake#toggle_quickfix(12,1)
"		if a:full == 0
"			VimTool build
"		else
"			VimTool rebuild
"		endif
"	endfunc
"
"	function! KillBuild()
"		silent call vimmake#toggle_quickfix(0)
"		VimStop
"	endfunc
"
"	function! RunTest()
"		silent call vimmake#toggle_quickfix(12,1)
"		VimTool test
"	endfunc
"
"	augroup QuickfixStatus
"	    au! BufWinEnter quickfix setlocal 
"		\ statusline=%t\ [%{g:vimmake_build_status}]\ %{exists('w:quickfix_title')?\ '\ '.w:quickfix_title\ :\ ''}\ %=%-15(%l,%c%V%)\ %P
"	augroup END
"
"	noremap <F12> :silent call vimmake#toggle_quickfix(12)<cr>
"	inoremap <F12> <esc>:silent call vimmake#toggle_quickfix(12)<cr>li
"	noremap <F10> :silent call DoBuild(0)<cr>
"	inoremap <F10> <esc>:silent call DoBuild(0)<cr>li
"	noremap <S-F10> :silent call DoBuild(1)<cr>
"	inoremap <S-F10> <esc>:silent call DoBuild(1)<cr>li
"	noremap <C-F10> :silent call KillBuild()<cr>
"	inoremap <C-F10> <esc>:silent call KillBuild()<cr>li
"	noremap <F11> :silent call RunTest()<cr>
"	inoremap <F11> <esc>:silent call RunTest()<cr>li
"endif
