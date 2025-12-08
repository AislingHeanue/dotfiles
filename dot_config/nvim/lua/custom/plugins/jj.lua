return {
  "mrdwarf7/lazyjui.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    -- cmd = { "jjui", "-r", "all()" },
    -- cmd = { "jjui" },
  },
  keys = {
    {
      "<Leader>jj",
      function()
        require("lazyjui").open()
      end,
    },
  }
}
