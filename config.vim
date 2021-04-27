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
set iskeyword+=$  " workaround for completion-nvim + Intelephense (see: https://github.com/nvim-lua/completion-nvim/issues/252)

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


"" completion-nvim settings
" use completion-nvim in every buffer (?)
autocmd BufEnter * lua require'completion'.on_attach()
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menuone,noinsert,noselect   " set completeopt to have a better completion experience
set shortmess+=c  " avoid showing message extra message when using completion
let g:completion_enable_snippet = 'snippets.nvim'
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_matching_smart_case = 1
" let g:completion_trigger_keyword_length = 2
" let g:completion_sorting = "length"
" let g:completion_timer_cycle = 200
" let g:completion_trigger_character = ['.', '::']
imap <c-j> <Plug>(completion_next_source)
imap <c-k> <Plug>(completion_prev_source)
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'snippet', 'buffers', 'ts', 'tabnine']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]


"" nvim-treesitter config
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      -- ["foo.bar"] = "Identifier",
    },
  },
  incremental_selection = {     -- TODO: learn how to use this module
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
" TODO: configure nvim-treesitter/playground


"" nvim-lspconfig (configs for Neovim's built-in LSP client)
lua << EOF
require'lspconfig'.intelephense.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.vuels.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.terraformls.setup{}

--require'lspconfig'.sumneko_lua.setup{}
--require'lspconfig'.yamlls.setup{}
--require'lspconfig'.tflint.setup{}
--require'lspconfig'.dockerls.setup{}
EOF
