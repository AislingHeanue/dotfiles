return {
  'f-person/git-blame.nvim',
  event = 'VeryLazy',
  opts = {
    enabled = false,
    -- message_template =
    -- " <summary> • <date> • <author> • <<sha>>",
    -- date_format = "%d-%m-%Y %H:%M:%S",
    -- virtual_text_column = 1,
  },
  keys = {
    { '<leader>gb', function() require('gitblame').open_commit_url(); end, desc = 'Open [B]lame on Remote', mode = 'n' }
  }
}
