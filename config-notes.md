## remaining LSP servers to set-up

```viml
lua <<EOF
+require'lspconfig'.html.setup{}
+require'lspconfig'.cssls.setup{}
require'lspconfig'.tsserver.setup{}
+--require'lspconfig'.vuels.setup{}
+require'lspconfig'.intelephense.setup{}
require'lspconfig'.pyls.setup{}
require'lspconfig'.sumneko_lua.setup{}
+require'lspconfig'.vimls.setup{}
require'lspconfig'.sqlls.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.yamlls.setup{}
+--require'lspconfig'.bashls.setup{}
--require'lspconfig'.dockerls.setup{}
--require'lspconfig'.texlab.setup{}
--require'lspconfig'.gdscript.setup{}
--require'lspconfig'.sourcekit.setup{}
--require'lspconfig'.elixirls.setup{}
EOF
```





## plugins to try-out

* nvim-telescope/telescope.nvim
* nanotee/nvim-lua-guide
* codota/tabnine-vim





## plugins abandoned

* wfxr/minimap.vim

* Plug 'tpope/vim-dadbod', {'on': 'DB'}
* " Plug 'kristijanhusak/vim-dadbod-ui'
* " Plug 'kristijanhusak/vim-dadbod-completion'

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







## mappings abandoned

```viml
xnoremap H ^
xnoremap L $
nnoremap ^ H
nnoremap $ L
xnoremap ^ H
xnoremap $ L
```
