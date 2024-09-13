return {
	"lervag/vimtex",
	config = function()
		vim.g["vimtex_view_enabled"] = 1
		vim.g["tex_flavor"] = "latex"
		-- vim.g['vimtex_view_method'] = 'skim' -- functional (with skim)
		vim.g["vimtex_view_method"] = "zathura" --dbus not working
		--vim.g['vimtex_quickfix_mode'] = 0
		vim.g["vimtex_view_skim_sync"] = 1
		vim.g["vimtex_view_skim_activate"] = 1
		-- Ignore mappings

		local keymap = vim.keymap

		keymap.set("n", "<localleader>v", "<plug>(vimtex-view)")
	end,
}
