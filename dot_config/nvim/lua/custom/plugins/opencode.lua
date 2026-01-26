---@module "opencode"
return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    "folke/snacks.nvim"
  },
  init = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      provider = {
        enabled = "snacks",
      }
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on the type or field.
    }

    -- Required for `opts.events.reload`.
    vim.o.autoread = true
  end,
  keys = {
    { "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, mode = "n", desc = "Ask opencode…" },
    { "<leader>ox", function() require("opencode").select() end, mode = "n", desc = "Execute opencode action…" },
    { "<leader>to", function() require("opencode").toggle() end, mode = "n", desc = "Toggle opencode" },
    { "<leader>oy", function() return require("opencode").operator("@this ") end, mode = { "n", "v" }, desc = "Add range to opencode", expr = true },
    { "<leader>oyy", function() return require("opencode").operator("@this ") .. "_" end, mode = "n", desc = "Add line to opencode", expr = true },
    { "<S-C-u>", function() require("opencode").command("session.half.page.up") end, mode = "n", desc = "Scroll opencode up" },
    { "<S-C-d>", function() require("opencode").command("session.half.page.down") end, mode = "n", desc = "Scroll opencode down" },
  },
}
