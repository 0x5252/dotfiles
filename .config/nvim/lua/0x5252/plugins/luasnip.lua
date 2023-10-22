return {
  "L3MON4D3/LuaSnip",
  config = function()
    local luasnip = require("luasnip")
    luasnip.config.set_config({
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
    })
  end,
}
