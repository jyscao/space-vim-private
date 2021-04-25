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
set undofile  " for vim-mundo
set undodir=~/.vim/undo

"" autocommands
autocmd TermOpen term://* startinsert     " enter terminal buffer in Insert instead of Normal mode
autocmd FileType json syntax match Comment +\/\/.\+$+



" Mappings

"" back to normal
inoremap jk <Esc>
cnoremap jk <Esc>
tnoremap jk <C-\><C-n>

"" better movements
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
lua << EOF
require'lspconfig'.intelephense.setup{}
--FIXME: auto-completion is wack
--require'lspconfig'.intelephense.setup{on_attach=require'completion'.on_attach}
EOF

" tree-sitter config
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      -- ["foo.bar"] = "Identifier",
    },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection    = "gnn",
      node_incremental  = "grn",
      scope_incremental = "grc",
      node_decremental  = "grm",
    },
  },
  indent = {
    enable = true
  }
}
EOF
