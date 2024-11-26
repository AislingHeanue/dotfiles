vim.opt.colorcolumn = "129"

vim.keymap.set('n', "<leader>gt", function()
	require("dap-go").debug_test()
end, { buffer = 0, desc = 'Debug [T]est' })
