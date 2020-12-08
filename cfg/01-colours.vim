colorscheme default
set background=dark

if &t_Co == 256
	hi String cterm=NONE ctermfg=LightGreen
	hi Constant cterm=bold ctermfg=Green
	hi Comment cterm=NONE ctermfg=LightMagenta
	hi Statement cterm=bold ctermfg=yellow
	hi Identifier cterm=NONE ctermfg=lightblue
	hi CursorLine cterm=NONE ctermbg=234
	hi CursorColumn cterm=NONE ctermbg=233
	hi ColorColumn ctermbg=52
	hi Search ctermfg=15 ctermbg=53
	hi Folded ctermbg=17 ctermfg=227
	hi Todo   ctermbg=0 ctermfg=214 cterm=italic,underline
	hi Error  ctermbg=0 ctermfg=197 cterm=italic,underline
endif
