inoremap jk <Esc>
"xnoremap jk <Esc>
cnoremap jk <Esc>
tnoremap jk <C-\><C-n>



set inccommand=split            " display result of incremental commands (ex. :%s/pat1/pat2/g)
"set updatetime=500              " used by GitGutter as its update interval
set formatprg=par\ -w78s0       " program used to reflow
set showtabline=1               " only show tabline with >1 tabs
"set guicursor+=a:blinkon0       " disable cursor blinking in all modes
set showcmd

""" Terminal tweaks
autocmd TermOpen term://* startinsert             " enter terminal buffer in Insert instead of Normal mode
