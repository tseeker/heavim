call dein#add('Exafunction/codeium.vim', #{
	\	lazy: 1,
	\	on_map: #{ i: '<F2>' },
	\ })

imap <F2>   <Cmd>call codeium#Complete()<CR>
imap <F3>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <F4>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <F5>   <Cmd>call codeium#Clear()<CR>
