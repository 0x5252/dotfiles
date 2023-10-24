return {
  "sudormrfbin/cheatsheet.nvim",
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    local cheatsheet = require("cheatsheet")
    local cs_telescope = require('cheatsheet.telescope.actions')

    cheatsheet.setup({
      bundled_cheatsheets = true,
      bundled_plugin_cheatsheets = true,
      include_only_installed_plugins = true,
      telescope_mappings = {
        ["<CR>"] = cs_telescope.select_or_fill_commandline,
        ["<A-CR>"] = cs_telescope.select_or_execute,
        ["<C-Y>"] = cs_telescope.copy_cheat_value,
        ["<C-E>"] = cs_telescope.edit_user_cheatsheet,
      }
    })
  end,
}
