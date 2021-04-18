let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ ]
let g:startify_bookmarks = [
            \ { 'A': '~/.config/awesome/' },
            \ { 'P': '~/.config/nvim/vim-plug/plugins.vim' },
            \ { 'Z': '~/.zshrc' },
            \ { 'P': '~/hdd/py4e/' },
            \ { 'S': '~/hdd/sdp/index.html' },
            \ ]
let g:startify_custom_header = [
                         \ '  ██╗     ███████╗███████╗███████╗ ██████╗  ██████╗ ',
                         \ '  ██║     ██╔════╝██╔════╝██╔════╝██╔════╝ ██╔═══██╗',
                         \ '  ██║     █████╗  ███████╗███████╗██║  ███╗██║   ██║',
                         \ '  ██║     ██╔══╝  ╚════██║╚════██║██║   ██║██║   ██║',
                         \ '  ███████╗███████╗███████║███████║╚██████╔╝╚██████╔╝',
                         \ '  ╚══════╝╚══════╝╚══════╝╚══════╝ ╚═════╝  ╚═════╝ ',
                    \]
