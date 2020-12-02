" General

"" settings
set showcmd
set showtabline=0
set smartcase
set nowrap        " TODO: set nowrap by default for .md (and others?) files
set inccommand=split
set formatprg=par\ -w78s0
set clipboard=unnamed
set cmdheight=1

"" autocommands
autocmd TermOpen term://* startinsert     " enter terminal buffer in Insert instead of Normal mode
autocmd FileType json syntax match Comment +\/\/.\+$+



" Mappings

"" back to normal
inoremap jk <Esc>
cnoremap jk <Esc>
tnoremap jk <C-\><C-n>

"" better movements
xnoremap H ^
xnoremap L $
nnoremap ^ H
nnoremap $ L
xnoremap ^ H
xnoremap $ L
nnoremap , gEb
nnoremap ; gE
xnoremap , gEb
xnoremap ; gE

"" insert blank lines in normal mode
nnoremap [<Space> O<Esc>
nnoremap ]<Space> o<Esc>

"" window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l





" Plugin Settings

"" vim-sneak
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
let g:sneak#s_next = 1
let g:sneak#absolute_dir = 1

"" vim-dadbod set-up
""" database for work
function! s:ppdb_define()
  call system("ip address show vpn_kanguru")
  if v:shell_error == 0
    let db_envs = map(readfile(glob("~/work-db.env")), "split(v:val, '=')")
    let env_map = {}
    for [env, val] in db_envs
      let env_map[env] = val
    endfor
    let host = env_map['DB_HOST']
    let user = env_map['DB_USERNAME']
    let pass = env_map['DB_PASSWORD']
    let g:ppdb = "mysql://".user.":".pass."@".host
    echomsg "company DB ready for use"
  else
    echomsg "must connect to company VPN to access DB"
  endif
endfunction
command PpdbDefine :call s:ppdb_define()



" Neovim's built-in LSP client
if has('nvim-0.5')
  lua <<EOF
  require'lspconfig'.intelephense.setup{}
  require'lspconfig'.pyls.setup{}
  require'lspconfig'.vimls.setup{}
EOF
endif
