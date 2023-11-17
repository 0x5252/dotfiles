return {
  -- require("luasnip").snippet(
  --   { -- snippet parameters
  --     trig="hi",
  --     dscr="autotriggering snippet expand hi to hello world",
  --     regTrig=false,
  --     priority=100,
  --     snippetType="autosnippet"
  --   },
  --   {
  --     t("Hello, world!"),
  --   }
  -- ),
  s(
    {
      trig = 'h1',
      dscr = "A LaTeX section",
      snippetType = "autosnippet",
    },
    fmta(
      [[
      \section{<>}
      <>
    ]],
      {
        i(1),
        i(2),
      })
  ),
  s(
    {
      trig = 'table',
      dscr = 'Table Snippet for different tables',
      snippetType = "autosnippet",
    },
    fmta(
      [[
      \begin{<>}{<>}
        <>
      \end{<>}
      ]],
      {
        i(1),
        i(2),
        i(3),
        rep(1),
      }
    )
  ),
}
