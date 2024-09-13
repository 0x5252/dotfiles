return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

			-- Navigation
			map("n", "]h", gs.next_hunk, "Next Hunk")
			map("n", "[h", gs.prev_hunk, "Prev Hunk")

			-- Actions
			map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
			map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
			map("v", "<leader>hs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Stage hunk")
			map("v", "<leader>hr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, "Reset hunk")

			map("n", "<leader>hS", gs.stage_buffer, "Stage all hunks in current buffer.")
			map("n", "<leader>hR", gs.reset_buffer, "Reset the lines of all hunks in the buffer.")

			map("n", "<leader>hu", gs.undo_stage_hunk, "Undo the last call of stage_hunk().")

			map(
				"n",
				"<leader>hp",
				gs.preview_hunk,
				"Preview the hunk at the cursor position in a floating window. If the preview is already open, calling this will cause the window to get focus."
			)

			map(
				"n",
				"<leader>hb",
				function()
					gs.blame_line({ full = true })
				end,
				"Run git blame on the current line and show the results in a floating window. If already open, calling this will cause the window to get focus."
			)
			map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle Blame for current line")
			map("n", "<leader>hd", gs.diffthis, "Perform a vimdiff on the given file with {base} if it is given")
			map("n", "<leader>hD", function()
				gs.diffthis("~")
			end, "Diff against the last commit")

			-- Text object
			map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk under the cursor")
		end,
	},
}
