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
    git = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true } -- Wrap notifications
      }
    }
  },
  keys = {
    { "<leader>un", function() Snacks.notifier.hide() end,           desc = "Dismiss All Notifications" },
    { "<leader>bd", function() Snacks.bufdelete() end,               desc = "Delete Buffer" },
    { "<leader>gg", function() Snacks.lazygit() end,                 desc = "Lazygit" },
    { "<leader>go", function() Snacks.gitbrowse() end,               desc = "Git Open Line" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end,        desc = "Lazygit Current File History" },
    { "<leader>gl", function() Snacks.lazygit.log() end,             desc = "Lazygit Log (cwd)" },
    { "<leader>cR", function() Snacks.rename.rename_file() end,      desc = "Rename File" },
    { "<c-/>",      function() Snacks.terminal() end,                desc = "Toggle Terminal" },
    { "<c-_>",      function() Snacks.terminal() end,                desc = "which_key_ignore" },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference",              mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference",              mode = { "n", "t" } },
  },
}
