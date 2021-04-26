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





## mappings abandoned

```viml
xnoremap H ^
xnoremap L $
nnoremap ^ H
nnoremap $ L
xnoremap ^ H
xnoremap $ L
```
