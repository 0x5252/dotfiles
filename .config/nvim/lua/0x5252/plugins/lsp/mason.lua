return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_dapconfig = require("mason-nvim-dap")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_dapconfig.setup({
			enusre_installed = {
				"debugpy",
				"delve",
			},
		})
		mason_lspconfig.setup({
			ensure_installed = {
				"html",
				"lua_ls",
				"pyright",
				"texlab",
				"gopls",
				-- "debugpy",
				-- "black",
				-- "pyright",
				-- "mypy",
			},
			automatic_installation = true,
		})
	end,
}
