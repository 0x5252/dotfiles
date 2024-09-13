return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",                  -- text in buffer
    "hrsh7th/cmp-path",                    --file system paths
    "L3MON4D3/LuaSnip",                    -- snippet engine
    "saadparwaiz1/cmp_luasnip",            -- for autocompletion
    "rafamadriz/friendly-snippets",        -- useful snippets
    "onsails/lspkind.nvim",                -- vs-code like pictograms
    "hrsh7th/cmp-nvim-lsp-signature-help", -- show parameters while typing
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    -- load vscode style snippets from plugins (e.g. friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      -- configure how cmp interacts with snippet engine
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      --mapping = cmp.mapping.preset.insert({
      --["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
      --["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
      --["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll down in function descr.
      --["<C-f>"] = cmp.mapping.scroll_docs(4),  -- scroll up in function descr.
      --["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
      --["<C-e"] = cmp.mapping.abort(), -- close completion window
      --["<CR>"] = cmp.mapping.confirm({ select = false }),
      --}),
      mapping = {
        ["<C-e"] = cmp.mapping.abort(),         -- close completion window
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        -- Super-Tab
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump() -- only jump in current snippet region
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      -- autocomplete sources
      sources = cmp.config.sources({
        { name = "nvim_lsp" },                -- nvim lsp server
        { name = "luasnip" },                 -- snippets
        { name = "buffer" },                  --  text in current buffer
        { name = "path" },                    -- file system paths
        { name = "nvim_lsp_signature_help" }, -- while typing
      }),
      -- configuration for lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
