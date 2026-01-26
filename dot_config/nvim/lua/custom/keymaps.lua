-- [[ Basic Keymaps ]]
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- Disabled because it adds a lag period to just pressing <Esc> which feels terrible
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
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
-- same in terminal mode
vim.keymap.set({ 't' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't' }, '<A-l>', '<C-\\><C-n><C-w>l')

-- Diagnostics
vim.keymap.set('n', '<leader>eq', vim.diagnostic.setloclist, { desc = 'Show [Q]uick fix list' })
vim.keymap.set('n', '<leader>es', vim.diagnostic.open_float, { desc = 'Show [E]rror message' })
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end)
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end)
-- Use WASM flags for gopls (restart nvim to disable)
vim.keymap.set({ 'n', 'i', 'v' }, '<A-w>', function()
  vim.env.GOOS = 'js'
  vim.env.GOARCH = 'wasm'
  vim.cmd('LspRestart gopls')
  vim.cmd('LspRestart golangci_lint_ls')
end)

-- Move Ctrl+6 to somewhere less awful for my hands
vim.keymap.set({ 'n', 'i', 'v' }, '<A-i>', '<C-^>', { noremap = true, silent = true, desc = 'Edit previous file' })

-- Toggle virtual line errors
-- local virtual_lines = false
-- vim.keymap.set({ 'n', 'v' }, '<A-e>', function()
--   if virtual_lines then
--     vim.diagnostic.config({ virtual_lines = false })
--   else
--     vim.diagnostic.config({ virtual_lines = { current_line = true } })
--   end
--   virtual_lines = not virtual_lines
-- end, { desc = 'Toggle Virtual Lines' })

-- next and previous misspelled word
vim.keymap.set('n', ']w', ']s', { noremap = true })
vim.keymap.set('n', '[w', '[s', { noremap = true })
-- @s to fix the next misspelling
vim.fn.setreg('s', ']wzg')
-- @d to fix 1000 misspellings in buffer
vim.fn.setreg('d', '1000@s')
-- @n to preform the last action on the next match
vim.fn.setreg('n', 'n.')

-- Newline mid-line in normal mode
vim.keymap.set({ 'n', 'v' }, '<C-j>', 'i<CR><Esc>^')

vim.keymap.set({ 'n' }, '<leader>d', function() vim.diagnostic.open_float() end,
  { silent = true, desc = 'Show highlighted [D]iagnostics' })
-- <leader>p to paste without moving cursor
vim.keymap.set({ 'n' }, '<leader>p', 'p`[h')

-- Prevent <S-j> from removing newlines in a highlighted region, which catches me when I enter line-selection mode with <S-v>
vim.keymap.set({ 'v' }, '<S-j>', 'j')
vim.keymap.set({ 'v' }, '<S-k>', 'k')
