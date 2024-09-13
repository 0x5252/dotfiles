return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		local keymap = vim.keymap

		keymap.set("n", "<leader>b", function()
			dap.toggle_breakpoint()
		end, { desc = "Toggle Breakpoint in line" })

		keymap.set("n", "<F5>", function()
			dap.continue()
		end, { desc = "Continue Program" })
		keymap.set("n", "<F10>", function()
			dap.step_over()
		end, { desc = "Step Over Function" })
		keymap.set("n", "<F11>", function()
			dap.step_into()
		end, { desc = "Step Into Function" })
		keymap.set("n", "<F12>", function()
			dap.step_out()
		end, { desc = "Step out of function" })
	end,
}
