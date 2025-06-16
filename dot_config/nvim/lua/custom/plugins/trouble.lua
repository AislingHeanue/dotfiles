return {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>et",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "[T]rouble",
    },
    --   {
    --     "<leader>eT",
    --     "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    --     desc = "[T]rouble (Current Buffer)",
    --   },
    --   {
    --     "<leader>es",
    --     "<cmd>Trouble symbols toggle focus=false<cr>",
    --     desc = "Trouble [S]ymbols",
    --   },
    --   {
    --     "<leader>el",
    --     "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    --     desc = "Trouble [L]SP Definitions / references / ...",
    --   },
    --   {
    --     "<leader>eL",
    --     "<cmd>Trouble loclist toggle<cr>",
    --     desc = "Trouble [L]ocation List",
    --   },
    --   {
    --     "<leader>eQ",
    --     "<cmd>Trouble qflist toggle<cr>",
    --     desc = "Trouble [Q]uickfix List (Trouble)",
    --   },
  }
}
