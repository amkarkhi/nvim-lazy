local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "nvim-tree/nvim-web-devicons" })
	use({ "nvim-tree/nvim-tree.lua" })
	use({ "akinsho/bufferline.nvim" })
	use({ "moll/vim-bbye" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "ahmedkhalf/project.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "goolord/alpha-nvim" })
	use({ "folke/which-key.nvim" })

	-- Colorschemes
	use({ "folke/tokyonight.nvim" })
	use({ "ellisonleao/gruvbox.nvim" })

	-- Cmp
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })

	-- Snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/mason.nvim" }) -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "RRethy/vim-illuminate" })
	use({ "MunifTanjim/prettier.nvim" })

	-- emmet
	use({ "mattn/emmet-vim" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.4" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-treesitter/nvim-treesitter-context" })

	-- Git
	use({ "lewis6991/gitsigns.nvim" })
	use({ "tpope/vim-fugitive" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins

	-- copilot
	use({ "github/copilot.vim" })
	use({
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = { { "github/copilot.vim" }, { "nvim-lua/plenary.nvim" } }, -- for curl, log wrapper
		opts = {
			debug = false,
		},
	})

	--debug
	use({ "mfussenegger/nvim-dap" })
	use({ "leoluz/nvim-dap-go" })
	use({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })
	use({ "nvim-telescope/telescope-dap.nvim" })
	use({ "theHamsta/nvim-dap-virtual-text" })
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use({
		"microsoft/vscode-js-debug",
		opt = true,
		run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	})

	-- prime
	use({ "theprimeagen/harpoon", branch = "harpoon2" })
	use({ "mbbill/undotree" })
	use({ "folke/zen-mode.nvim" })
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	-- amin
	use({ "tpope/vim-obsession" })
	use({ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } })
	use({ "rhysd/vim-grammarous" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
