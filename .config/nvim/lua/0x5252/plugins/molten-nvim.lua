return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0",
		dependencies = { "3rd/image.nvim" },
		build = ":UpdateRemotePlugins",
		init = function()
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20
		end,
		vim.keymap.set("n", "<leader>mi", ":MoltenInit<cr>"),
		vim.keymap.set("n", "<leader>me", ":MoltenEvaluateOperator<CR>"),
		vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>"),
		vim.keymap.set("n", "<leader>mr", ":MoltenReevaluateCell<CR>"),
		vim.keymap.set("v", "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv"),
		vim.keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>"),
	},
	{
		"3rd/image.nvim",
		opts = {
			backend = "kitty",
			max_width = 100,
			max_height = 12,
			max_height_window_percentage = math.huge,
			max_width_window_percentage = math.huge,
			window_overlap_clear_enabled = true,
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		},
	},
}
