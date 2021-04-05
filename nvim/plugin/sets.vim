set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set laststatus=2
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set noswapfile
set updatetime=50
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


