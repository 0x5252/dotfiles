return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		local keymap = vim.keymap
		local ui = require("harpoon.ui")

		keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end)
		keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end)
		keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end)
		keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end)

		keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		keymap.set("n", "<C-S-N>", function()
			harpoon:list():prev()
		end)
		-- keymap.set("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = "Mark file with harpoon" })
		-- keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Show harpoon files" })
		-- keymap.set("n", "<leader><C-j>", function() ui.nav_next() end)
		-- keymap.set("n", "<leader><C-k>", function() ui.nav_prev() end)
	end,
}
