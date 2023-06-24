call dein#add('vim-perl/vim-perl', #{
	\	lazy: 1,
	\	on_ft: ['perl'],
	\	merged: 0,
	\	build: 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny',
	\ })
