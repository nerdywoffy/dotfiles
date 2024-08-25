-- setup toggleterm
require("toggleterm").setup({
	open_mapping = [[<leader>t]],
	winbar = {
		enabled = true,
		name_formatter = function(term) --  term: Terminal
			return term.name
		end,
	},
})

-- setup legendary
require("legendary").setup({ extensions = { lazy_nvim = true } })

-- setup telescope
require("telescope").setup({
	defaults = {
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
		-- yaml = { "yq" },
		bash = { "beautysh" },
		javascript = { { "prettierd", "prettier" } },
		sql = { "sql-formatter" },
	},
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

-- setup tailwind-tools
require("tailwind-tools").setup({
	-- your configuration
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

-- set termguicolors
vim.opt.termguicolors = true

-- set tab to 4 space
vim.opt.ts = 4
vim.opt.sts = 4
vim.opt.sw = 4

-- smart tab and number
vim.opt.smarttab = true
vim.opt.number = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- command pallette-alike commands
vim.keymap.set("n", "<C-p>f", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<C-p>p", "<cmd>Telescope commands<cr>")
vim.keymap.set("n", "<C-p>/", "<cmd>Telescope live_grep<cr>")

-- tab navigation
vim.keymap.set("n", "<leader>[", "<cmd>tabp<cr>")
vim.keymap.set("n", "<leader>]", "<cmd>tabn<cr>")

-- disable mouse
vim.opt.mouse = ""
