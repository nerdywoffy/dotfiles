-- https://github.com/ray-x/go.nvim?tab=readme-ov-file#integrate-with-mason-lspconfig
require("mason").setup()
require("mason-lspconfig").setup()
require('go').setup{
  lsp_cfg = false
}
local gopls_cfg = require'go.lsp'.config() 
require('lspconfig').gopls.setup(gopls_cfg)
