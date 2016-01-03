execute pathogen#infect()

let g:pencil_higher_contrast_ui = 1
:colorscheme pencil

let &colorcolumn=join(range(80,999),",")

:set autoindent
:set shiftwidth=4
:set tabstop=4

:set number

"don't remove lines with only whitespace
:inoremap <CR> <CR>X<C-H>

"Set window name to current file name.
let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif
