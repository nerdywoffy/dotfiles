local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
	"nvim-neo-tree/neo-tree.nvim",
	keys = {
	  { "<leader>ff", "<cmd>Neotree<cr>", desc = "NeoTree" },
	  { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
	},
	dependencies = {
	  "nvim-lua/plenary.nvim",
	  "nvim-tree/nvim-web-devicons",
	  "MunifTanjim/nui.nvim",
	},
	config = function()
	  require("neo-tree").setup()
	end,
  },
  {
	"ray-x/go.nvim",
	dependencies = { 
	"ray-x/guihua.lua",
	"neovim/nvim-lspconfig",
	"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("go").setup()
	end,
	event = {"CmdlineEnter"},
	ft = {"go", "gomod"},
	build = ':lua require("go.install").update_all_sync()'
  },
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  {
	"vim-airline/vim-airline",
	lazy = false,
	priority = 1000,
	dependencies = {
		{"vim-airline/vim-airline-themes"},
		{"ryanoasis/vim-devicons"}, 
	}
  },
  {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && npm install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
  },
  {
	"mrjones2014/legendary.nvim",
	version = "v2.13.9",
	priority = 10000,
	lazy = false,
	dependencies = { "kkharji/sqlite.lua" }
  },
  {
	"stevearc/dressing.nvim",
	opts = {},
  },
  {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
	"theHamsta/nvim-dap-virtual-text",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio"
	}
  },
  {
	"akinsho/toggleterm.nvim",
	keys = {
	  { "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Toggleterm" },
	},
	version = "*",
	config = true
  },
  {
	"kdheepak/lazygit.nvim",
	cmd = {
	  "LazyGit",
	  "LazyGitConfig",
	  "LazyGitCurrentFile",
	  "LazyGitFilter",
	  "LazyGitFilterCurrentFile",
	},
	dependencies = {
	  "nvim-lua/plenary.nvim",
	},
	keys = {
	  { "<leader>g", "<cmd>LazyGit<cr>", desc = "LazyGit" }
	}
  }
})
