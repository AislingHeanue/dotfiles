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
    -- Use select inside an indented block. Also animates the left
    -- margin of a block for clarity
    -- - vii - Select inside indent
    -- - vai - Select around indent
    -- - [i  - Go to start of indent
    -- - ]i  - Go to end of indent
    -- Note: these settings will likely need to be changed
    -- on a per-filetype basis
    require('mini.indentscope').setup {
      draw = {
        delay = 0,
        animation = require('mini.indentscope').gen_animation.none()
      },
      options = {
        -- make it so that the top line of a function refences the indented block below it.
        try_as_border = true
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
  end
}
