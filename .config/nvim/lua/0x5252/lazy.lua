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

-- Add Plugins in {}
require("lazy").setup({
	{ import = "0x5252.plugins" },
	{ import = "0x5252.plugins.lsp" },
	{ import = "0x5252.plugins.debugger" },
})
