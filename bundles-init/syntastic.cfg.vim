let g:syntastic_mode_map = {
		\ 'mode': 'passive'
	\ }
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_ignore_files = ['\m^/usr/include/']

nnoremap <silent> <Leader>ss :SyntasticToggleMode<cr>
nnoremap <silent> <Leader>sc :SyntasticCheck<cr>
