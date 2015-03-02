" Vi, no.
set nocompatible

" Syntax, yes.
syntax on

" Change cursor to line in Insert Mode, block in Command Mode.
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Revert cursor to line when exiting vim.
autocmd VimLeave * let &t_me="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"

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
set hlsearch

" Pathogen
execute pathogen#infect()

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
