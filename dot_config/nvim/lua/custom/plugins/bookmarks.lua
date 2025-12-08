return {
  "LintaoAmons/bookmarks.nvim",
  -- pin the plugin at specific version for stability
  -- backup your bookmark sqlite db when there are breaking changes (major version change)
  tag = "3.2.0",
  dependencies = {
    { "kkharji/sqlite.lua" },
    { "nvim-telescope/telescope.nvim" },
    { "stevearc/dressing.nvim" },    -- optional: better UI
    { "GeorgesAlkhouri/nvim-aider" } -- optional: for Aider integration
  },
  opts = {},
  keys = {
    { "<leader>w",  "<cmd>BookmarksMark<cr>", desc = "[W]rite bookmark here" },
    { "<leader>sb", "<cmd>BookmarksGoto<cr>", desc = "[W]rite bookmark here" },
  }
}
