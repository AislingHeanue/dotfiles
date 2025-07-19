return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/playground',
    {
      'nvim-treesitter/nvim-treesitter-context',
      opts = {
        multiwindow = true,
        multiline_threshold = 1
      }
    },
    { -- Add indentation guides even on blank lines
      'lukas-reineke/indent-blankline.nvim',
      main = 'ibl',
      opts = {},
    },
  },
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    folding = true,
    ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'go', 'rust' },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
    matchup = {
      enabled = true,
      disable = { "ruby" },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
        },
      },
      move = {
        enable = true,
        goto_next_end = {
          ["]s"] = { query = "@local.scope", query_group = "locals", desc = "End of scope" },
        },
        goto_previous_start = {
          ["[s"] = { query = "@local.scope", query_group = "locals", desc = "Start of scope" },
        }
      }
    },
  },
}
