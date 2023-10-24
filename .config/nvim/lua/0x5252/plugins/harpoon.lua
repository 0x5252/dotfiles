return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local keymap = vim.keymap
    local ui = require("harpoon.ui")

    keymap.set("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>", { desc = "Mark file with harpoon"} )
    keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Show harpoon files"} )
    keymap.set("n", "<leader><C-j>", function() ui.nav_next() end)
    keymap.set("n", "<leader><C-k>", function() ui.nav_prev() end)
  end,
}
