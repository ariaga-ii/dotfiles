filetype plugin indent on
let mapleader=" "
set expandtab
set tabstop=2
set nobackup
set cmdheight=1
set noswapfile
set updatetime=50
set softtabstop=2
set shiftwidth=2
set laststatus=2
set encoding=utf-8
set hidden
set nowritebackup
"set colorcolumn=80

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
else
  set signcolumn=yes
  set signcolumn=number
endif

if (has('termguicolors'))
  set termguicolors
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'davidgranstrom/scnvim', { 'do': {-> scnvim#install() } }
Plug 'SirVer/ultisnips'
call plug#end()

function FindProject()
  return finddir('.git/..', expand('%:p:h').';') 
endfunction

