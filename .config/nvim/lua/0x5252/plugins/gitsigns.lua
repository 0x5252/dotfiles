return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function ()
    local gitsigns = require("gitsigns")

    gitsigns.setup({
        signs = {
          add          = { hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
          change       = { hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
          delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
          topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
          changedelete = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
          untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          interval = 1000,
          follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
        yadm = {
          enable = false
        },

        -- Keybinds
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer =bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          map({'n', 'v'}, '<leader>ghs', ':Gitsigns stage_hunk<CR>', { desc = "Stage Hunk" })
          map({'n', 'v'}, '<leader>ghr', ':Gitsigns reset_hunk<CR>', { desc = "Reset Hunk" })
          map('n', '<leader>ghS', gs.stage_buffer, { desc = "Stage all hunks in current buffer." })
          map('n', '<leader>ghu', gs.undo_stage_hunk, { desc = "Undo the last call of stage_hunk()." })
          map('n', '<leader>ghR', gs.reset_buffer, { desc = "Reset the lines of all hunks in the buffer." })
          map('n', '<leader>ghp', gs.preview_hunk, { desc = "Preview the hunk at the cursor position in a floating window. If the preview is already open, calling this will cause the window to get focus." })
          map('n', '<leader>ghb', function() gs.blame_line{full=true} end, { desc = "Run git blame on the current line and show the results in a floating window. If already open, calling this will cause the window to get focus." })
          map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "Toggle Blame for current line" })
          map('n', '<leader>ghd', gs.diffthis, { desc = "Perform a vimdiff on the given file with {base} if it is given" })
          map('n', '<leader>ghD', function() gs.diffthis('~') end, { desc = "Diff against the last commit" })
          map('n', '<leader>td', gs.toggle_deleted, { desc = "Show deleted hunkss" })

          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = "Select hunk under the cursor"})
        end
    })
  end,
}
