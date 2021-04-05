filetype plugin indent on
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv


call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'morhetz/gruvbox'
" Plug 'arcticicestudio/nord-vim'
" Plug 'drewtempelmeyer/palenight.vim'
" Plug 'danilo-augusto/vim-afterglow'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'doums/darcula'
call plug#end()

