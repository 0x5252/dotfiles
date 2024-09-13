return {
	"vimwiki/vimwiki",
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "~/vaults/work/",
				syntax = "markdown",
				ext = ".md",
				links_space_char = "_",
				auto_tags = 1,
			},
			{
				path = "~/vaults/personal/",
				syntax = "markdown",
				ext = ".md",
				links_space_char = "_",
				auto_tags = 1,
			},
		}

		vim.g.vimwiki_syntax_plugins = {
			codeblock = {
				["```lua"] = { parser = "lua" },
				["```python"] = { parser = "python" },
				["```javascript"] = { parser = "javascript" },
				["```bash"] = { parser = "bash" },
				["```html"] = { parser = "html" },
				["```css"] = { parser = "css" },
				["```c"] = { parser = "c" },
			},
		}

		local keymap = vim.keymap

		keymap.set("n", "<leader>vs", ":vs | :VimwikiIndex<CR>")
	end,
}
