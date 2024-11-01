return {
  'f-person/git-blame.nvim',
  event = 'VimEnter',
  opts = {
    enabled = true,
    message_template =
    " <summary> • <date> • <author> • <<sha>>",
    date_format = "%d-%m-%Y %H:%M:%S",
    virtual_text_column = 1,
  },
  keys = {
    { '<leader>gb', function() require('gitblame').open_commit_url(); end, desc = 'open [b]lame commit', mode = 'n' }
  }
}
