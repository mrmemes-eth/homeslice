syntax on
filetype plugin indent on

set visualbell

set wildmenu
set wildmode=list:longest,full

set splitright
set splitbelow

set hidden

set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=bash

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END

set bg=dark
set laststatus=2

set nu
set shell=zsh

" make <Tab> characters less heinous
set tabstop=2
set shiftwidth=2
set expandtab

if exists('+colorcolumn')
  set colorcolumn=81
endif

if !has('gui_running')
  set t_Co=256
endif

augroup markdown
  autocmd!
  autocmd FileType markdown set formatoptions=tcqn textwidth=78
augroup END

nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" blurgh XML
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
