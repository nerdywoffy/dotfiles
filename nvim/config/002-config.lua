-- setup legendary
require("legendary").setup({ extensions = { lazy_nvim = true } })

-- setup telescope
require("telescope").setup({
	defaults = {
		layout_strategy = "vertical",
		layout_config = {
			prompt_position = "top",
			mirror = true,
			vertical = { width = 0.85 },
		},
	},
})

-- setup ibl
require("ibl").setup()

-- setup formatter
require("conform").setup({
	formatters_by_ft = {
		-- do not register go as it is using formatter that handled by `go.format` on go.nvim instead
		lua = { "stylua" },
		javascript = { { "prettierd", "prettier" } },
		json = { "jq" },
		yaml = { "yq" },
		javascript = { { "prettierd", "prettier" } },
	},
})

vim.keymap.set("n", "<leader>p", function()
	require("conform").format()
end)

-- go.nvim - format before save
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
	group = format_sync_grp,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- set tab to 4 space
vim.opt.ts = 4
vim.opt.sts = 4
vim.opt.sw = 4

-- smart tab and number
vim.opt.smarttab = true
vim.opt.number = true

-- command pallette-alike commands
vim.keymap.set("n", "<C-p>f", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<C-p>p", "<cmd>Telescope commands<cr>")
vim.keymap.set("n", "<C-p>/", "<cmd>Telescope live_grep<cr>")
