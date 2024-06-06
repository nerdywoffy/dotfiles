require("mason").setup()
require("mason-lspconfig").setup()
local coq = require("coq") -- add this

-- https://github.com/ray-x/go.nvim?tab=readme-ov-file#integrate-with-mason-lspconfig
require("go").setup({
	lsp_cfg = false,
})
local gopls_cfg = require("go.lsp").config()

-- other lsp config
require("lspconfig").gopls.setup(gopls_cfg)
require("lspconfig").tailwindcss.setup(coq.lsp_ensure_capabilities({}))
require("lspconfig").tsserver.setup(coq.lsp_ensure_capabilities({}))
require("lspconfig").eslint.setup(coq.lsp_ensure_capabilities({}))
require("lspconfig").html.setup(coq.lsp_ensure_capabilities({}))
require("lspconfig").cssls.setup(coq.lsp_ensure_capabilities({}))
