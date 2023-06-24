let g:lsp_settings = {
\   'pylsp-all': {
\     'workspace_config': {
\       'pylsp': {
\         'plugins': {
\           'black': {
\             'enabled' : v:true ,
\           },
\           'pycodestyle': {
\             'maxLineLength' : 88 ,
\           },
\           'pylint': {
\             'enabled': v:true,
\           }
\         }
\       }
\     }
\   },
\}

let g:lsp_settings['pylsp'] = g:lsp_settings['pylsp-all']
