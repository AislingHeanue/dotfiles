vim.api.nvim_win_set_cursor(0, { 1, 0 })
vim.wo.spell = true
if vim.fn.getline(1) == '' then
	vim.cmd 'startinsert!'
end
