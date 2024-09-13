return {
	s(
		{
			trig = "h1",
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
			}
		)
	),
	s(
		{
			trig = "table",
			dscr = "Table Snippet for different tables",
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
