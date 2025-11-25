return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  ft = "markdown",
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    "BufReadPre /home/aisling/dev/AislingHeanue/obsidian-notes/*.md",
    "BufNewFile /home/aisling/dev/AislingHeanue/obsidian-notes/*.md",
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "notes",
        path = "~/dev/AislingHeanue/obsidian-notes",
      },
    },
  }
}
