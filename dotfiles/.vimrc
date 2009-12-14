syntax on
filetype plugin indent on

augroup RCVisual
  autocmd!
  autocmd GUIEnter *  colorscheme vividchalk
  autocmd GUIEnter *  set go-=T
augroup END

augroup mkd
  autocmd!
  autocmd BufRead *.md  set ai formatoptions=tcroqn2 comments=n:> tw=80 spell
augroup END

augroup php
  autocmd!
  autocmd FileType php  set et sw=2
  autocmd FileType php  unlet! b:did_indent | runtime! indent/html.vim
augroup END


runtime! autoload/pathogen.vim
if exists("g:loaded_pathogen")
  call pathogen#runtime_append_all_bundles()
end

if (has('gui_running'))
  set guifont=Inconsolata:h18
  set guioptions=egmrLtT
  set columns=100
  set lines=42
endif

set clipboard=exclude:.*
set vb
set splitbelow
set splitright
set hidden

nmap <silent> <F1> <Esc>:%s/\s\+$//gi<CR>

iabbrev rdebug require 'ruby-debug'; Debugger.start; debugger
iabbrev bound puts '*'*80

highlight Primary ctermbg=red ctermfg=white guibg=#592929
match Primary /primary/

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

