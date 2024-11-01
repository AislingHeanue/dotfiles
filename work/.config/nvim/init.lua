require("custom.options")
require("custom.keymaps")
require("custom.cmd")

-- Run :Lazy, :Mason and :checkhealth for status things.
require('lazy').setup(
  {
    'tpope/vim-sleuth',
    { 'Bilal2453/luvit-meta',     lazy = true },
    { 'folke/lazydev.nvim',       ft = 'lua',         opts = { library = { { path = 'luvit-meta/library', words = { 'vim%.uv' } } } } },
    { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' },                                     opts = { signs = false } },
    { import = 'custom.plugins' },
  }
)
