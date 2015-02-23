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
	hi LineNr ctermfg=58
	hi CursorLineNr ctermfg=130
	hi Search ctermfg=15 ctermbg=53
endif
