" Vi, no.
set nocompatible

" Syntax, yes.
syntax on

" Change cursor to line in Insert Mode, block in Command Mode.
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Don't move cursor backwards when exiting command mode. Has added
" benefit of immediately redrawing cursor when exiting Command Mode
" too.

inoremap <special> <Esc> <Esc>`^

" Todo: auto reload.

" With a map leader it's possible to do extra key combinations like
" <leader>w saves the current file.
let mapleader = ","
let g:mapleader = ","

" Fast saving.
nmap <leader>w :w!<cr>

" Fast quitting.
nmap <leader>q :q<cr>
nmap <leader>Q :q!<cr>

" Fast reload .vimrc.
nmap <leader>r :so $MYVIMRC<cr>:echo "Reloaded!"<cr>

" Always show current position.
set ruler

" Hilight search results.
" set hlsearch
