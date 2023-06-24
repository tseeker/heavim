call dein#add('hashivim/vim-terraform', #{
	\	lazy: 1,
	\	merge_ftdetect: v:true,
	\	on_ft: ['hcl', 'terraform'],
	\	on_cmd: ['Terraform', 'TerraformFmt']
	\ })
