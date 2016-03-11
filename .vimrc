execute pathogen#infect()

colorscheme pencil
set background=light
let g:pencil_gutter_color = 1
let g:neocomplete#enable_at_startup = 1

let &colorcolumn=join(range(81,999),",")

set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4

set number

set nobomb
set encoding=utf-8
setglobal fileencoding=utf-8

"don't remove lines with only whitespace
inoremap <CR> <CR>X<C-H>

"Set window name to current file name.
let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif
