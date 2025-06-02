--- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
-- set this option for matchup so that the match doesn't appear in the statusbar
vim.g.matchup_matchparen_offscreen = { method = "popup" }
-- Disable netrw when opening vi in a folder
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  See `:help 'clipboard'
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- Set default tab size, when it is not overwritten by vim-sleuth or filetype defaults
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- Enable break indent
-- Wrapped lines of test will follow the indentation of the first line
vim.opt.breakindent = true
-- Save undo history
vim.opt.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'
-- Decrease update time for the swap file (ie for autorecovery)
vim.opt.updatetime = 250
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 500
-- Configure how new splits should be opened
-- Usage: Ctrl-W v and Ctrl-W s
-- or use Ctrl-v to open a window in a split from telescope
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '▉', nbsp = '␣' }
-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
-- Show which line your cursor is on
vim.opt.cursorline = true
-- only highlight the line number
vim.opt.cursorlineopt = "number"
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 15
-- Spell Checking
vim.opt.spelllang = 'en_gb'
vim.opt.spell = true
vim.opt.spelloptions = 'camel'
vim.opt.spellcapcheck = ""

-- Cap the amount of results in completion prompts to 15 displayed at once.
vim.opt.pumheight = 15

vim.filetype.add({
  extension = {
    tmpl = "gotmpl",
  },
})

vim.diagnostic.config({
  virtual_text = true,
  -- virtual_lines = {
  --   current_line = true
  -- }
})
