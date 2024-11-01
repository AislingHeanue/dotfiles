return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  event = "VimEnter",
  opts = {},
  keys = {
    -- Actions
    -- visual mode
    { '<leader>gs', function() require("gitsigns").stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, mode = 'v', desc = 'stage git hunk' },
    { '<leader>gr', function() require("gitsigns").reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, mode = 'v', desc = 'reset git hunk' },
    -- normal mode
    { '<leader>gs', function() require("gitsigns").stage_hunk() end,                                    mode = 'n', desc = '[s]tage hunk' },
    { '<leader>gr', function() require("gitsigns").reset_hunk() end,                                    mode = 'n', desc = '[r]eset hunk' },
    { '<leader>gS', function() require("gitsigns").stage_buffer() end,                                  mode = 'n', desc = '[S]tage buffer' },
    { '<leader>gu', function() require("gitsigns").undo_stage_hunk() end,                               mode = 'n', desc = '[u]ndo stage hunk' },
    { '<leader>gR', function() require("gitsigns").reset_buffer() end,                                  mode = 'n', desc = '[R]eset buffer' },
    { '<leader>gp', function() require("gitsigns").preview_hunk() end,                                  mode = 'n', desc = '[p]review hunk' },
    { '<leader>gb', function() require("gitsigns").blame_line() end,                                    mode = 'n', desc = '[b]lame line' },
    { '<leader>gd', function() require("gitsigns").diffthis() end,                                      mode = 'n', desc = '[d]iff against index' },
    { '<leader>gD', function() require("gitsigns").diffthis '@' end,                                    mode = 'n', desc = '[D]iff against last commit' },
    -- Toggles
    { '<leader>tb', function() require("gitsigns").toggle_current_line_blame() end,                     mode = 'n', desc = '[T]oggle git show [b]lame line' },
    { '<leader>tD', function() require("gitsigns").toggle_deleted() end,                                mode = 'n', desc = '[T]oggle git show [D]eleted' },
    {
      '[c',
      function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          require("gitsigns").nav_hunk 'next'
        end
      end,
      mode = 'n',
      desc = 'Jump to next git [c]hange'
    },
    {
      ']c',
      function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          require("gitsigns").nav_hunk 'prev'
        end
      end,
      mode = 'n',
      desc = 'Jump to previous git [c]hange'
    },
  }
}
