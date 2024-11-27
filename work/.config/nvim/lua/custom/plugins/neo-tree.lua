return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '<A-u>', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      hijack_netrw_behavior = 'open_current',
      filtered_items = {
        visible = true,
      },
      window = {
        width = 30,
        mappings = {
          ['<space>'] = '',
          ['<A-u>'] = 'close_window',
          ['<leftrelease>'] = 'open',
          ['l'] = 'open',
          ['h'] = 'close_node'
        },
      },
    },
  },
}
