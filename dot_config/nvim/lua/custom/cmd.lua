-- Restore cursor position on reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 0 and line <= vim.fn.line("$") then
      vim.cmd("normal! g'\"")
    end
  end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})


vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    ---@diagnostic disable-next-line: undefined-field
    vim.opt.spelloptions:remove("noplainbuffer")

    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
      pattern = "*",
      callback = function()
        ---@diagnostic disable-next-line: undefined-field
        vim.opt.spelloptions:remove("noplainbuffer")
      end,
    })
  end,
})

-- Workspace linting
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    for _, client in ipairs(vim.lsp.get_clients()) do
      require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
    end
  end
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     -- Get the module name dynamically
--     local module_name = vim.fn.system("go list -m"):gsub("%s+", "")
--     if module_name == "" then
--       return
--     end
--
--     -- Use `goimports` via stdin/stdout to format the buffer in-place
--     local goimports_cmd = string.format("goimports -local %s", module_name)
--     local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
--     local formatted = vim.fn.systemlist(goimports_cmd, lines)
--
--     -- Replace buffer contents with formatted output
--     if vim.v.shell_error == 0 then
--       vim.api.nvim_buf_set_lines(0, 0, -1, true, formatted)
--     end
--   end
-- })

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

vim.treesitter.query.add_directive(
  "inject-go-tmpl!",
  function(_, _, bufnr, _, metadata)
    local fname = vim.fs.basename(vim.api.nvim_buf_get_name(bufnr))
    local _, _, ext, _ = string.find(fname, ".*%.(%a+)(%.%a+)")
    print(ext)
    metadata["injection.language"] = ext
  end, {})

vim.filetype.add({
  extension = {
    tmpl = "gotmpl",
  },
})

-- Treat all files in the chezmoi folder as chezmoi files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
  callback = function(ev)
    local bufnr = ev.buf
    local edit_watch = function()
      require("chezmoi.commands.__edit").watch(bufnr)
    end
    vim.schedule(edit_watch)
  end,
})


---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
