return {
  "Zeioth/compiler.nvim",
  cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
  dependencies = {
    "stevearc/overseer.nvim",
  },
  opts = {},
  config = function()
    local api = vim.api

    api.nvim_buf_set_keymap(0, 'n', '<F6>', "<cmd>CompilerOpen<CR>",
      { noremap = true, silent = true, desc = "Open Compiler" })
    api.nvim_buf_set_keymap(0, 'n', '<S-F6>', function()
      vim.cmd("CompilerStop")
      vim.cmd("CompilerRedo")
    end, { noremap = true, silent = true, desc = "Stop compiler and redo last one" })
  end
}
