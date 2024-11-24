return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  event = "VimEnter",
  lazy = false,
  opts = {
    current_line_blame = true
  },
  keys = {
    -- Actions
    -- visual mode
    { '<leader>gs', function() require("gitsigns").stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, mode = 'v', desc = '[S]tage Git hunk' },
    { '<leader>gr', function() require("gitsigns").reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, mode = 'v', desc = '[R]eset Git hunk' },
    -- normal mode
    { '<leader>gs', function() require("gitsigns").stage_hunk() end,                                    mode = 'n', desc = '[S]tage hunk' },
    { '<leader>gr', function() require("gitsigns").reset_hunk() end,                                    mode = 'n', desc = '[R]eset hunk' },
    { '<leader>gS', function() require("gitsigns").stage_buffer() end,                                  mode = 'n', desc = '[S]tage buffer' },
    { '<leader>gu', function() require("gitsigns").undo_stage_hunk() end,                               mode = 'n', desc = '[U]ndo stage hunk' },
    { '<leader>gR', function() require("gitsigns").reset_buffer() end,                                  mode = 'n', desc = '[R]eset buffer' },
    { '<leader>gp', function() require("gitsigns").preview_hunk() end,                                  mode = 'n', desc = '[P]review hunk' },
    { '<leader>gb', function() require("gitsigns").blame_line() end,                                    mode = 'n', desc = '[B]lame line' },
    { '<leader>gd', function() require("gitsigns").diffthis() end,                                      mode = 'n', desc = '[D]iff against index' },
    { '<leader>gD', function() require("gitsigns").diffthis '@' end,                                    mode = 'n', desc = '[D]iff against last commit' },
    -- Toggles
    { '<leader>tb', function() require("gitsigns").toggle_current_line_blame() end,                     mode = 'n', desc = '[T]oggle git show [B]lame line' },
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
      desc = 'Next Git [C]hange'
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
      desc = 'Previous Git [C]hange'
    },
  }
}
