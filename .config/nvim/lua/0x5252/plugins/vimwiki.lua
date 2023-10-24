return {
  "vimwiki/vimwiki",
  init = function()
    vim.g.vimwiki_list = {
      {
        path = "~/vimwiki_work/",
        syntax = "markdown",
        ext = ".md",
        links_space_char = "_",
        atuo_tags = 1,
      },
      {
        path = "~/vimwiki_personal/",
        syntax = "markdown",
        ext = ".md",
        links_space_char = "_",
        atuo_tags = 1,
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
      }
    }

    local keymap = vim.keymap

    keymap.set("n", "<leader>vs", ":vs | :VimwikiIndex<CR>")
  end,
}
