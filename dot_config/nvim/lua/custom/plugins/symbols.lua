return {
  "vaengir/symbols-outline.nvim",
  cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
  opts = {
    position = 'left',
    width = 16,
  },
  keys = {
    { "<A-o>", "<cmd>SymbolsOutline<cr>", desc = "Toggle Symbol Sidebar", },
  },
}
