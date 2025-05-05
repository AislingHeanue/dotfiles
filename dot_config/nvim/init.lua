require("custom.options")
require("custom.keymaps")
require("custom.cmd")

-- Run :Lazy, :Mason and :checkhealth for status things.
require('lazy').setup(
  {
    'tpope/vim-sleuth',
    'towolf/vim-helm',
    {
      'Bilal2453/luvit-meta',
      lazy = true
    },
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = { library = { { path = 'luvit-meta/library', words = { 'vim%.uv' } } }
      }
    },
    {
      'folke/todo-comments.nvim',
      event = 'VimEnter',
      dependencies = { 'nvim-lua/plenary.nvim', },
      opts = { signs = false }
    },
    {
      'mbbill/undotree',
      keys = { { '<leader>tu', function() vim.cmd.UndotreeToggle() end, desc = "Toggle [U]ndo Tree", mode = { "n", "v" } } },
    },
    {
      'AndrewRadev/splitjoin.vim',
      config = function()
        vim.keymap.set('n', 'gS', '<plug>SplitjoinSplit', { desc = "[S]plit single-line definition" })
        vim.keymap.set('n', 'gJ', '<plug>SplitjoinJoin', { desc = "[J]oin multiline definition" })
      end,
    },
    {
      'nvim-pack/nvim-spectre',
      dependencies = { 'folke/trouble.nvim' },
      keys = { { '<leader>ts', function() require('spectre').toggle() end, desc = "Toggle [S]pectre", mode = 'n' } }
    },
    { -- Add indentation guides even on blank lines
      'lukas-reineke/indent-blankline.nvim',
      main = 'ibl',
      opts = {},
    },
    { import = 'custom.plugins' },
  }
)
