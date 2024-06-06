-- setup legendary
require('legendary').setup({ extensions = { lazy_nvim = true } })

-- go.nvim - format before save
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

-- set tab to 4 space 
vim.opt.ts = 4
vim.opt.sts = 4
vim.opt.sw = 4

-- command pallette-alike commands
vim.keymap.set('n', '<C-p>f', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<C-p>p', '<cmd>Telescope commands<cr>')
vim.keymap.set('n', '<C-p>/', '<cmd>Telescope live_grep<cr>')
