return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('telescope').setup {}
    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'flutter')
    local telescope = require 'telescope'
    vim.keymap.set('n', '<leader>se', telescope.extensions.flutter.commands, { desc = '[S]earch Flutter Commands' })
  end,
}
