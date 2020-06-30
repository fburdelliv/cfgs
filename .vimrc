set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'valloric/youcompleteme'
Plugin 'dense-analysis/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



"maps split switching
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

"switch line start and end
nnoremap B ^
nnoremap E $

syntax on 
set tabstop=4 
set shiftwidth=4 
set expandtab
set showmatch "matches parens etc
set encoding=utf-8
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly

"set cursorcolumn
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

set splitbelow
set splitright
set nu
"set nonu

set clipboard=unnamedplus

autocmd BufWinLeave *.* mkview "auto saves views for folds
autocmd BufWinEnter *.* silent loadview  "auto loads views for folds

