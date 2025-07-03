return {              -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    icons = {
      -- set icon mappings to true if you have a Nerd Font
      mappings = vim.g.have_nerd_font,
    },
    -- Document existing key chains
    spec = {
      { '<leader>c', group = '[C]ode',                mode = { 'n', 'x' } },
      { '<leader>b', group = '[B]reakpoints' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>g', group = '[G]it',                 mode = { 'n', 'v' } },
      { '<leader>e', group = '[E]rrors (Diagnostics)' },
      { '<leader>p', group = '[P]ersistence Sessions' }
    },
  },
  keys = {
    { '<F1>', function() require('which-key').show() end, desc = 'Show Which-Key', mode = { 'n', 'i' } }
  }
}
