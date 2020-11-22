" General

"" settings
set showcmd
set showtabline=1
set smartcase
set inccommand=split
set formatprg=par\ -w78s0
set clipboard=

"" autocommands
autocmd TermOpen term://* startinsert     " enter terminal buffer in Insert instead of Normal mode
" " TODO: need something like TextYankPre, and trigger outside of Vim to be useful
" autocmd TextYankPost * call s:backup_unnamedplus(v:event)
" function s:backup_unnamedplus(ev_dict) abort
"   if a:ev_dict.regname ==# '+'
"     echo a:ev_dict
"     let @*=@+
"   endif
" endfunction



" Mappings

"" back to normal
inoremap jk <Esc>
cnoremap jk <Esc>
tnoremap jk <C-\><C-n>

"" better movements
nnoremap , gE
nnoremap ; gEb

"" window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l





" Plugin Settings

"" vim-sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S
let g:sneak#label = 1
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
let g:sneak#s_next = 1
let g:sneak#absolute_dir = 1

"" vim-operator-surround
map <silent>sa <Plug>(operator-surround-append)
map <silent>sd <Plug>(operator-surround-delete)
map <silent>sr <Plug>(operator-surround-replace)
