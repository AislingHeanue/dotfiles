-- [[ Basic Keymaps ]]
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Diagnostic keymap
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
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
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- Move a line or a visual block up or down a line using Alt+j/k
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
