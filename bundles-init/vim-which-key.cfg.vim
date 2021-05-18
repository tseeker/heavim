" Leader-based key sequences
nnoremap <silent> <Space> :<c-u>WhichKey '<Space>'<CR>
let g:which_key_map = {}
call which_key#register('<Space>', 'g:which_key_map')
let g:which_key_fallback_to_native_key = 1

" Direct commands
let g:which_key_map[' '] = [ 'call feedkeys(":nohlsearch\n")' , 'clear-search' ]
let g:which_key_map.e = 'file-explorer'
let g:which_key_map.u = 'undo-tree'
let g:which_key_map.q = 'toggle-quickfix'

" Options
let g:which_key_map.o = { 'name' : '+options' }
let g:which_key_map.o.c = 'cursor-dir'
let g:which_key_map.o.C = 'cursor-mode'
let g:which_key_map.o.m = 'mouse'
let g:which_key_map.o.n = 'line-numbers'
let g:which_key_map.o.N = 'relative-line-numbers'
let g:which_key_map.o.p = 'paste'
let g:which_key_map.o.w = 'whitespace'
let g:which_key_map.o.s = 'sign-column'

" Fuzzy finder
let g:which_key_map.p = { 'name' : '+fuzzy-finder' }
let g:which_key_map.p.p = 'buffers'
let g:which_key_map.p.o = 'recent-files'
let g:which_key_map.p.i = 'open-file'

" Git commands
let g:which_key_map.g = { 'name' : '+git' }
let g:which_key_map.g['+'] = 'add-hunk'
let g:which_key_map.g['-'] = 'revert-hunk'
let g:which_key_map.g['<'] = 'previous-hunk'
let g:which_key_map.g['>'] = 'next-hunk'
let g:which_key_map.g.a = 'add-file'
let g:which_key_map.g.b = 'branch'
let g:which_key_map.g.B = 'new-branch'
let g:which_key_map.g.C = 'checkout-branch'
let g:which_key_map.g.c = 'commit'
let g:which_key_map.g.d = 'diff'
let g:which_key_map.g.L = 'log-full'
let g:which_key_map.g.l = 'log-split'
let g:which_key_map.g.M = 'move'
let g:which_key_map.g.P = 'push'
let g:which_key_map.g.p = 'pull'
let g:which_key_map.g.r = 'rename'
let g:which_key_map.g.R = 'remove'
let g:which_key_map.g.s = 'status'
let g:which_key_map.g.z = 'unstage'

" Help
let g:which_key_map.h = { 'name' : '+help' }
let g:which_key_map.h.m = 'man-page'
let g:which_key_map.h.v = 'vim-help'

" Language helpers
let g:which_key_map.l = { 'name' : '+language' }
let g:which_key_map.l.d = 'diagnostics'
let g:which_key_map.l.f = 'format'
let g:which_key_map.l.g = { 'name' : '+goto' }
let g:which_key_map.l.g.d = 'declaration'
let g:which_key_map.l.g.D = 'definition'
let g:which_key_map.l.i = 'information'
let g:which_key_map.l.r = 'references'
let g:which_key_map.l.R = 'rename'
let g:which_key_map.l.s = 'document-symbols'
let g:which_key_map.l.s = 'workspace-symbols'

" Plugins
let g:which_key_map.P = { 'name' : '+plugins' }
let g:which_key_map.P.i = 'install-new'
let g:which_key_map.P.u = 'update'

" Terminal
let g:which_key_map.t = { 'name' : '+terminal' }
let g:which_key_map.t.t = 'terminal-right'
let g:which_key_map.t.z = 'terminal-top'
let g:which_key_map.t.q = 'terminal-left'
let g:which_key_map.t.s = 'terminal-bottom'
let g:which_key_map.t.d = 'terminal-right'

" Tests
let g:which_key_map.T = { 'name' : '+tests' }
let g:which_key_map.T.a = 'run-all'
let g:which_key_map.T.f = 'run-file'
let g:which_key_map.T.c = 'run-nearest'
let g:which_key_map.T.T = 'run-previous'
