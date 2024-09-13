-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local keymap = vim.keymap

-- keybinds
-- clear search highlight
keymap.set("n", "<leader>nh", "nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close new tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to prev tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open currrent buffer in new tab" })

keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move to split left" })
keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move to split below" })
keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move to split above" })
keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move to split right", remap = true })

-- Workaround for compiler.nvim
keymap.set("n", "<F9>", function()
	vim.cmd("w")
	vim.cmd("CompilerOpen")
end, { noremap = true, silent = true, desc = "Open Compiler" })
keymap.set("n", "<S-F9>", function()
	vim.cmd("CompilerStop")
	vim.cmd("CompilerRedo")
end, { noremap = true, silent = true, desc = "Stop compiler and redo last one" })
keymap.set("n", "<S-F8>", function()
	vim.cmd("CompilerToggleResults")
end, { desc = "Compiler Resume" })
