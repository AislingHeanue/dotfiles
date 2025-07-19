return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 499,
      opts = {
        use_nvim_treesitter = true
      }
    }
    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()
    -- Operators!
    -- g= (lua), gm (multiply text), gx (exchange text regions, 2 steps), gr (replace highlighted with register), gs (sort)
    require('mini.operators').setup()
    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }
    -- You can configure sections in the statusline by overriding their
    -- default behaviour. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- Set the text in the Mode indicator to be black. Also make the background for normal mode more green.
    -- I really should just switch to lualine.
    vim.api.nvim_set_hl(0, 'MiniStatuslineModeNormal', { bg = "green", bold = true })
    for _, mode in ipairs({ "Normal", "Insert", "Visual", "Replace", "Command" }) do
      local attrs = vim.api.nvim_get_hl(0, { name = 'MiniStatuslineMode' .. mode })
      ---@diagnostic disable-next-line: assign-type-mismatch
      attrs.fg = "black"
      ---@diagnostic disable-next-line: param-type-mismatch
      vim.api.nvim_set_hl(0, 'MiniStatuslineMode' .. mode, attrs)
    end
  end
}
