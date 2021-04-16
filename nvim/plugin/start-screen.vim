let g:startify_session_dir= '~/.config/nvim/session'

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Files']            },
      \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ ]
let g:startify_bookmarks = [
      \ { 'n': '~/dotfiles/nvim' },
      \ { 'z': '~/dotfiles/.zshrc' },
      \ '~/oct/payment-microsite',
      \ '~/oct/solver-on-demand/gui',
      \ '~/oct/solver-on-demand/solver-service-api',
      \ ]
let g:startify_custom_header = [                                        
      \'            ,**,                  //.       ',
      \'          *******,                /////     ',
      \'       ,************              ///////   ',
      \'     */////***/******             //////////',
      \'    .//////////********           //////////',
      \'    .//////(///*********,         //////////',
      \'    .////////(/***********        ((((((((((',
      \'    ./////////(*************      ((((((((((',
      \'    .//////////  ************.    ((((((((((',
      \'    .//////////    ************   ((((((((((',
      \'    .//////////     */**********/ ((((((((((',
      \'    .(((((((((/       *///////////((((((((((',
      \'    ./(((((((((        .*/////////((((((((((',
      \'    .((((((((((          /*///////((((((((((',
      \'    .((((((((((            ///////((((((#(((',
      \'      /((((((((             ./////((((((((* ',
      \'         ((((((               ////((((((    ',
      \'           /(((                 //(((/      ',
      \'              (                  ,(         ',
      \]

