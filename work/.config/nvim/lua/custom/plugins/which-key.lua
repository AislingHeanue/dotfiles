return {                  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter',     -- Sets the loading event to 'VimEnter'
  opts = {
    icons = {
      -- set icon mappings to true if you have a Nerd Font
      mappings = vim.g.have_nerd_font,
    },
    -- Document existing key chains
    spec = {
      { '<leader>c', group = '[C]ode',     mode = { 'n', 'x' } },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>b', group = 'Debug' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>g', group = '[G]it',      mode = { 'n', 'v' } },
    },
  },
  keys = {
    { '<F1>', function() require('which-key').show() end, desc = 'Show Which-Key', mode = { 'n', 'i' } }
  }
}