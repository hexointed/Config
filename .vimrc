execute pathogen#infect()

set t_Co=256
colorscheme pencil
set background=light
let g:pencil_gutter_color = 1

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length=2
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#sources#buffer#max_keyword_length = 8

let &colorcolumn=81

set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4

set number
set relativenumber

set nobomb
set enc=utf-8
set fileencodings=utf-8
set encoding=utf-8
setglobal fileencoding=utf-8

set incsearch
set hlsearch

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

"use TAB as autocomplete key
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <S-Tab> <C-p>
command W execute "w"

" <CR>: close popup and save indent. And don't remove lines with only 
" whitespace.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplete#close_popup() . "\<CR>x\<C-H>"
	" For no inserting <CR> key.
	"return pumvisible() ? neocomplete#close_popup() : "\<CR>x\<C-H>"
endfunction

inoremap <silent><BS> x<C-H><C-H>

" don't use arrow keys to move in autocomplete popup
inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"

"Set window name to current file name.
let &titlestring = expand("%:t")
if &term == "screen"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
  set title
endif

let g:Hours=0
let g:Minutes=0

au BufNewFile,BufRead *.idr set filetype=haskell

function! Sum()
	let g:Hours = 0
	let g:Minutes = 0
	normal Gdd
	call feedkeys(":%s/\\(\\d\\+\\):\\(\\d\\+\\)/\\=Sum_h(submatch(1),submatch(2),submatch(0))/\<CR>\<Esc>G")
	call feedkeys("oTotal:     \<Esc>")
	call feedkeys("\"=g:Hours\<CR>pa:\<Esc>\"=g:Minutes\<CR>p\<Esc>")
	call feedkeys(":if g:Minutes <= 9 | call feedkeys(\"i0\\<Esc>\") | endif | if g:Hours < 100 | call feedkeys(\"0wa \\<Esc>$\") | endif \<CR>")
endfunction

function! Sum_h(hours, minutes, string)
	let g:Minutes = g:Minutes + a:minutes
	if g:Minutes >= 60
		let g:Minutes = g:Minutes - 60
		let g:Hours = g:Hours + 1
	endif
	let g:Hours = g:Hours + a:hours
	return a:string
endfunction
