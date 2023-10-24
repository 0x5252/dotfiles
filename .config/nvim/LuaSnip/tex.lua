return {
  require("luasnip").snippet(
    { -- snippet parameters
      trig="hi",
      dscr="autotriggering snippet expand hi to hello world",
      regTrig=false,
      priority=100,
      snippetType="autosnippet"
    },
    {
      t("Hello, world!"),
    }
  ),
  s(
    {
      trig='h1',
      dscr = "A LaTeX section",
      snippetType = "autosnippet"
    },
    {
      t("\\section{"),
      i(1),
      t("}")
    }
  )
}
