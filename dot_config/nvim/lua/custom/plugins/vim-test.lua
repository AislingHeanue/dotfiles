return {
  "vim-test/vim-test",
  keys = {
    { "<leader>ut", ":TestNearest<CR>", desc = "Test Nearest" },
    { "<leader>uf", ":TestFile<CR>",    desc = "Test File" },
    { "<leader>us", ":TestSuite<CR>",   desc = "Test Suite" },
    { "<leader>ur", ":TestLast<CR>",    desc = "Test Last" },
  },
  config = function()
    vim.g['test#strategy'] = 'neovim' -- run tests inside Neovim terminal
    vim.g['test#javascript#runner'] = 'mocha'
  end
}
