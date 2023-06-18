call dein#add('ctrlpvim/ctrlp.vim', #{
	\	lazy: 1,
	\	on_cmd: ['CtrlPBuffer', 'CtrlPMRUFiles', 'CtrlP']
	\ })

nnoremap <Leader>pp :CtrlPBuffer<CR>
nnoremap <Leader>po :CtrlPMRUFiles<CR>
nnoremap <Leader>pi :CtrlP<CR>
