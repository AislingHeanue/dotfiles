-- [[ Basic Keymaps ]]
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
-- Keybinds to make split navigation easier.
--
vim.keymap.set('n', '<A-S-j>', ':m .+1<CR>', { desc = 'Move line down one line', noremap = true, silent = true })
vim.keymap.set('n', '<A-S-k>', ':m .-2<CR>', { desc = 'Move line up one line', noremap = true, silent = true })
vim.keymap.set('v', '<A-S-j>', ":m '>+1<CR>gv=gv", { desc = 'Move line down one line', noremap = true, silent = true })
vim.keymap.set('v', '<A-S-k>', ":m '<-2<CR>gv=gv", { desc = 'Move line down one line', noremap = true, silent = true })
-- make window wider
vim.keymap.set('n', '<A-,>', '<C-w>5<')
vim.keymap.set('n', '<A-.>', '<C-w>5>')
-- make window taller
vim.keymap.set('n', '<A-t>', '<C-w>+')
vim.keymap.set('n', '<A-s>', '<C-w>-')
-- quit window
vim.keymap.set('n', '<A-q>', '<C-w>q')
-- window navigation
vim.keymap.set({ 'n', 'i', 'v' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n', 'i', 'v' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n', 'i', 'v' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n', 'i', 'v' }, '<A-l>', '<C-w>l')

-- Diagnostics
vim.keymap.set('n', '<leader>eq', vim.diagnostic.setloclist, { desc = 'Show [Q]uick fix list' })
vim.keymap.set('n', '<leader>es', vim.diagnostic.open_float, { desc = 'Show [E]rror message' })
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = 1 }) end)
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = -1 }) end)
-- Use WASM flags for gopls (restart nvim to disable)
vim.keymap.set({ 'n', 'i', 'v' }, '<A-w>', function()
  vim.env.GOOS = 'js'
  vim.env.GOARCH = 'wasm'
  vim.cmd('LspRestart')
end)

-- Move Ctrl+6 to somewhere less awful for my hands
vim.keymap.set({ 'n', 'i', 'v' }, '<A-i>', '<C-^>', { noremap = true, silent = true, desc = 'Edit previous file' })

vim.fn.setreg('s', ']szg')
vim.fn.setreg('d', '1000@s')


-- Newline mid-line in normal mode
vim.keymap.set({ 'n', 'v' }, '<C-j>', 'i<CR><Esc>^')
