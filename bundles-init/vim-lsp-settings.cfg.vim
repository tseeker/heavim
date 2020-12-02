let g:lsp_settings = {
\   'pyls-all': {
\     'workspace_config': {
\       'pyls': {
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
