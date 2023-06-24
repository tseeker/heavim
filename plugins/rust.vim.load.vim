call dein#add('rust-lang/rust.vim', #{
	\	lazy: 1,
	\	on_ft: ['rust'],
	\	on_cmd: ['Cargo', 'RustFmt', 'RustRun', 'RustExpand', 'RustTest']
	\ })
