---@module "snacks"
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    -- don't explode with big files
    bigfile = { enabled = true },
    dashboard = {
      preset = {
        pick = nil,
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          -- { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          -- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[







        ]],
      },
      enable = true,
      formats = {
        key = function(item)
          return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
        end,
      },
      sections = {
        { section = "header", indent = 60 },
        {
          pane = 2,
          section = "terminal",
          cmd = "~/.config/nvim/header.sh $PWD something", -- removing "something" here gives a (bad) cached value that I don't know how to destroy.
          ttl = 0,
          height = 8,
          padding = 2,
          indent = -60,
        },
        {
          { section = "keys", gap = 1, padding = 3 },
          -- { section = "startup", indent = 60, padding = 5 },
        },
        {
          pane = 2,
          {
            icon = " ",
            title = "Recent Files",
            padding = 1,
          },
          {
            section = "recent_files",
            opts = { limit = 3 },
            indent = 2,
            padding = 1,
          },
          -- { come back to this if I want to replace tmux with mini.sessions
          --   icon = " ",
          --   title = "Projects",
          --   padding = 1,
          -- },
          -- {
          --   section = "projects",
          --   confirm = function() print("hi") end,
          --   opts = { limit = 3 },
          --   indent = 2,
          --   padding = 1,
          -- },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
        },
      },
    },
    -- file explorer (neo-tree replacement)
    explorer = {
      replace_netrw = true,
    },
    -- top right notifications
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    -- for inputting text at the top middle of the screen (eg for refactor-rename)
    -- default otherwise is a prompt in the command bar.
    input = { enabled = true },
    -- potentially better telescope
    picker = {
      sources = {
        explorer = {
          -- git_status_open = true,
          auto_close = true,
          hidden = true,
          ignored = true,
          layout = {
            layout = {
              width = 32,
            }
          }
        },
        files = {
          hidden = true,
        },
        grep = {
          hidden = true,
          exclude = {
            "documentation"
          }
        }
      }
    },
    -- rich git blame info for line, <leader>gi
    git = { enabled = true },
    -- render file before plugins are loaded (makes vim feel faster)
    quickfile = { enabled = true },
    -- document highlighting of matching symbols under cursor
    words = { enabled = true },
    -- replace mini.ai. Jump to end of current indent with ]i, etc. Select in indent with vii
    scope = {},
    -- provides styles for windows for folke plugins
    styles = {
      notification = {
        wo = { wrap = true } -- Wrap notifications
      }
    }
  },
  keys = {
    -- open dashboard
    -- {
    --   "<leader>w",
    --   function()
    --     if vim.api.nvim_buf_get_name(0) == "" then
    --       return
    --     end
    --     Snacks.dashboard()
    --   end,
    --   desc = "Open Dashboard"
    -- },

    -- close current buffer
    { "<leader>q",        function() Snacks.bufdelete() end,               desc = "[Q]uit buffer" },

    -- git stuff (bit messy)
    { "<leader>gg",       function() Snacks.lazygit() end,                 desc = "Lazygit" },
    { "<leader>go",       function() Snacks.gitbrowse() end,               desc = "[O]pen on remote" },
    { "<leader>gi",       function() Snacks.git.blame_line() end,          desc = "View Git Blame [I]nfo" },
    { "<leader>gf",       function() Snacks.lazygit.log_file() end,        desc = "[F]ile History" },
    { "<leader>gl",       function() Snacks.lazygit.log() end,             desc = "[L]og commits" },

    -- rename
    { "<leader>rf",       function() Snacks.rename.rename_file() end,      desc = "[F]ile" },

    -- matching references (from 'words')
    { "]r",               function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Matching Reference",               mode = { "n", "t" } },
    { "[r",               function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Matching Reference",               mode = { "n", "t" } },

    -- Explorer
    { "<A-u>",            function() Snacks.explorer.open() end,           desc = "Open explorer" },

    -- Picker (replaces Telescope)
    { '<leader>sh',       function() Snacks.picker.help() end,             desc = '[S]earch [H]elp' },
    { '<leader>sk',       function() Snacks.picker.keymaps() end,          desc = '[S]earch [K]eymaps' },
    { '<leader>sf',       function() Snacks.picker.files() end,            desc = '[S]earch [F]iles' },
    { '<leader>ss',       function() Snacks.picker.pickers() end,          desc = '[S]earch [S]elect Picker' },
    { '<leader>sg',       function() Snacks.picker.grep() end,             desc = '[S]earch by [G]rep' },
    { '<leader>sd',       function() Snacks.picker.diagnostics() end,      desc = '[S]earch [D]iagnostics' },
    { '<leader>sr',       function() Snacks.picker.resume() end,           desc = '[S]earch [R]esume' },

    -- { 'n',          '<leader>se',                                    telescope.extensions.flutter.commands, { desc = '[S]earch Flutter Commands' } },
    { '<leader>s.',       function() Snacks.picker.recent() end,           desc = '[S]earch Recent Files ("." for repeat)' },
    { '<leader><leader>', function() Snacks.picker.buffers() end,          desc = '[ ] Find existing buffers' },
    { '<leader>sn', function()
      -- https://github.com/vandalt/LazyVim/blob/main/lua/lazyvim/plugins/extras/util/chezmoi.lua
      local results = require("chezmoi.commands").list({
        args = {
          "--path-style",
          "absolute",
          "--include",
          "files",
          "--exclude",
          "externals",
        },
      })
      local items = {}

      for _, czFile in ipairs(results) do
        table.insert(items, {
          text = czFile,
          file = czFile,
        })
      end

      ---@type snacks.picker.Config
      local opts = {
        items = items,
        confirm = function(picker, item)
          picker:close()
          require("chezmoi.commands").edit({
            targets = { item.text },
          })
        end,
      }
      Snacks.picker.pick(opts)
    end, { desc = '[S]earch Chezmoi/[N]vim Files' } },
    {
      '<leader>s/',
      function() Snacks.picker.grep { buffers = true } end,
      { desc = '[S]earch [/] in Open Files' }
    },
    -- -- Shortcut for searching your Neovim configuration files
  },
}
