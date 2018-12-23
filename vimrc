set nocompatible
filetype off

filetype plugin indent on
set sw=4 sts=4 et
au FileType cpp setl sw=4 sts=4 et
au FileType python setl sw=4 sts=4 et

autocmd FileType latex,tex,md,markdown setlocal spell
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set list
set listchars=tab:▸\ ,trail:~,extends:>,precedes:<

set ignorecase
set smartcase

set autoread
au CursorHold * checktime

set relativenumber
set number

set showcmd
set incsearch
set hlsearch
set mouse=a

nnoremap <CR> :noh<CR><CR>

inoremap jk <Esc>
vnoremap jk <Esc>

nnoremap <C-Q> :q<CR>
nnoremap <C-S> :w<CR>
inoremap <C-S> <Esc>:w<CR>

