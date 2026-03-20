return {
  { -- Parser installation and queries
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    main = 'nvim-treesitter',
    build = ':TSUpdate',
    opts = {},
    config = function(_, opts)
      require('nvim-treesitter').setup(opts)
      require('nvim-treesitter').install {
        'bash', 'c', 'diff', 'html', 'lua', 'luadoc',
        'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'go', 'rust',
        'typescript', 'tsx', 'javascript', 'jsdoc', 'yaml', 'hcl', 'javascript',
        'vue'
      }
      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      multiwindow = true,
      multiline_threshold = 1,
    },
  },
  { -- Textobjects (main branch for new nvim-treesitter)
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    main = 'nvim-treesitter-textobjects',
    opts = {
      select = {
        lookahead = true,
      },
      move = {
        set_jumps = true,
      },
    },
    keys = {
      {
        'as',
        function()
          require('nvim-treesitter-textobjects.select').select_textobject('@local.scope', 'locals')
        end,
        mode = { 'x', 'o' },
        desc = 'Select language scope'
      },
      {
        ']s',
        function()
          require('nvim-treesitter-textobjects.move').goto_next_end('@local.scope', 'locals')
        end,
        mode = { 'n', 'x', 'o' },
        desc = 'End of scope'
      },
      {
        '[s',
        function()
          require('nvim-treesitter-textobjects.move').goto_previous_start('@local.scope', 'locals')
        end,
        mode = { 'n', 'x', 'o' },
        desc = 'Start of scope'
      },
    },
  },
  { -- Indentation guides on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
}
