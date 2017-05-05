" mandatory defaults
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" plugins
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline' " powerline status bar
Plugin 'vim-airline/vim-airline-themes' " airline themes!
Plugin 'tpope/vim-fugitive' " gittt
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-ruby/vim-ruby' "ruby syntax
Plugin 'scrooloose/nerdtree' " tree explorer
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ntpeters/vim-better-whitespace' " highlight trailing whitespace
Plugin 'tpope/vim-surround' " easily surround chunks of text
Plugin 'edkolev/tmuxline.vim' " make tmux look like vim-airline
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-commentary'
Plugin 'valloric/youcompleteme'
Plugin 'rdnetto/ycm-generator'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'godlygeek/tabular' " align stuff
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-scripts/c.vim'
"Plugin 'shougo/unite.vim'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'easymotion/vim-easymotion'
call vundle#end()

" file specific styles
filetype plugin indent on
set sw=2 sts=2 et
au FileType cpp setl sw=2 sts=2 et
au FileType python setl sw=4 sts=4 et
au FileType ruby setl sw=2 sts=2 et
au FileType orogen setl sw=2 sts=2 et

" force syntax on filetypes
au BufNewFile,BufRead *.orogen setf ruby_orogen

" disable auto-commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" easier copy/paste
set pastetoggle=<F2>
set clipboard=unnamedplus
vnoremap <C-C> "+y

" give us 256 color schemes!
set term=screen-256color

" nice EOL and whitespace characters
set list
set listchars=tab:▸\ ,trail:~,extends:>,precedes:<
" set listchars=tab:▸\ ,eol:¬,trail:~,extends:>,precedes:<

" Solarized colorscheme
syntax enable
set background=dark
colorscheme solarized

" Airline status bar
set laststatus=2
set statusline+=%#warningmsg#
set statusline+=%*

let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_detect_paste=1
let g:airline_section_y = 0
let g:airline_section_z = 0
let g:airline_skip_empty_sections = 1
let g:airline_detect_modified = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

" numbering
set relativenumber
set number

"set ruler  " ruler at the bottom
set colorcolumn=80

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set backspace=indent,eol,start
set ruler
set showcmd
set incsearch
set hlsearch
set mouse=a

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Swithc to normal mode
inoremap jk <Esc>

" Save/close bindings
nnoremap <leader>q :q<CR>
nnoremap <C-Q> :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <C-S> :w<CR>
inoremap <leader>w <Esc>:w<CR>
inoremap <C-S> <Esc>:w<CR>

" Manage screen
nnoremap zm zz
nnoremap zh zt
nnoremap zl zb

" Manage windows
nnoremap <C-W>- :sp<CR>
nnoremap <C-W>\| :vsp<CR>

" Manage panes
nnoremap <C-W>c :tabnew<CR>
nnoremap <C-W>q :tabclose<CR>
nnoremap <C-W>n gt
nnoremap > gt
nnoremap < gT
nnoremap <C-W>1 1gt
nnoremap <C-W>2 2gt
nnoremap <C-W>3 3gt
nnoremap <C-W>4 4gt
nnoremap <C-W>5 5gt
nnoremap <C-W>6 6gt
nnoremap <C-W>7 7gt
nnoremap <C-W>8 8gt
nnoremap <C-W>9 9gt
nnoremap <C-W>0 :tablast<CR>

" Move line up/down
execute "set <A-J>=\ej"
execute "set <A-K>=\ek"
nnoremap <A-J> :m .+1<CR>==
nnoremap <A-K> :m .-2<CR>==
inoremap <A-J> <Esc>:m .+1<CR>==gi
inoremap <A-K> <Esc>:m .-2<CR>==gi
vnoremap <A-J> :m '>+1<CR>gv=gv
vnoremap <A-K> :m '<-2<CR>gv=gv

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
"let g:nerdtree_tabs_open_on_console_startup = 1

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

" ----- scrooloose/syntastic settings -----
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["cpp"] }
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- jez/vim-superman settings -----
" better man page support
noremap K :SuperMan <cword><CR>

" ----- valloric/youcompleteme settings -----
" set completeopt-=preview
map <Esc>[Z <S-Tab>
nnoremap <F5> :YcmForceCompileAndDiagnostics <CR>
let g:ycm_show_diagnostics_ui = 1
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_key_list_select_completion=['<Tab>']
let g:ycm_key_list_previous_completion=['<S-Tab>']
let g:ycm_error_symbol = '✘'
let g:ycm_warning_symbol = "▲"
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_cache_omnifunc=0
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_auto_trigger = 1
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_echo_current_diagnostic = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_goto_buffer_command = 'same-buffer'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" ---- sirVer/ultisnips settings -----
let g:UltiSnipsListSnippets="<C-S-Space>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsExpandTrigger="<nop>"
let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"
