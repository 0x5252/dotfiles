return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		require("dap-python").setup("python")

		local keymap = vim.keymap
		keymap.set("n", "<leader>dpr", function()
			require("dap-python").test_method()
		end, { desc = "Run Python Script with Debugger" })
	end,
}
