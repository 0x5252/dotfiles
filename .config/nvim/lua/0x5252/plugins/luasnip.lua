return {
  "L3MON4D3/LuaSnip",
  config = function()
    local luasnip = require("luasnip")
    local lua_loader = require("luasnip.loaders.from_lua")

    lua_loader.lazy_load({ paths = "~/.config/nvim/LuaSnip/"})
    luasnip.config.set_config({
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
    })
  end,
}
