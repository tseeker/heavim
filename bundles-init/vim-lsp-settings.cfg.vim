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
\           }
\         }
\       }
\     }
\   },
\}
