return {
	"AckslD/swenv.nvim",
	enabled = false,
	opts = {
		get_venvs = function(venvs_path)
			return require("swenv.api").get_venvs(venvs_path)
		end,
		venvs_path = vim.fn.expand("~/venvs"),
		post_set_venv = function()
			vim.cmd.LspRestart()
		end,
	},
	config = function()
		require("swenv").setup({
			post_set_venv = function()
				vim.cmd([[LspRestart]])
			end,
		})

		local swenv_api = require("swenv.api")
		local keymap = vim.keymap
		keymap.set("n", "<leader>V", function()
			swenv_api.pick_venv()
		end, { desc = "Pick VENV" })
	end,
}
