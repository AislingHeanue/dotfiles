return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  setup = function()
    _G.Snacks = {}
  end,
  opts = {
    bigfile = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    input = { enabled = true },
    picker = { enabled = true },
    git = { enabled = true },
    quickfile = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true } -- Wrap notifications
      }
    }
  },
  keys = {
    { "<leader>q",  function() Snacks.bufdelete() end,               desc = "[Q]uit buffer" },
    { "<leader>gg", function() Snacks.lazygit() end,                 desc = "Lazygit" },
    { "<leader>go", function() Snacks.gitbrowse() end,               desc = "[O]pen on remote" },
    { "<leader>gi", function() Snacks.git.blame_line() end,          desc = "View Git Blame [I]nfo" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end,        desc = "[F]ile History" },
    { "<leader>gl", function() Snacks.lazygit.log() end,             desc = "[L]og commits" },
    { "<leader>rf", function() Snacks.rename.rename_file() end,      desc = "[F]ile" },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference",       mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference",       mode = { "n", "t" } },
  },
}
