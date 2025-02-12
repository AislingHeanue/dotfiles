return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'leoluz/nvim-dap-go',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-neotest/nvim-nio',
    {
      'mrcjkb/rustaceanvim',
      version = '^5', -- Recommended
      lazy = false,   -- This plugin is already lazy
    }
  },
  opts = {
    listeners = {
      before = {
        attach = { dapui_config = function() require("dapui").open() end },
        launch = { dapui_config = function() require("dapui").open() end },
        event_terminated = { dapui_config = function() require("dapui").close() end },
        event_exited = { dapui_config = function() require("dapui").close() end }
      }
    }
  },
  config = function()
    require('dap-go').setup()
    require('dapui').setup()
    require('nvim-dap-virtual-text').setup {
      display_callback = function(var)
        if #var.value > 15 then
          return " " .. string.sub(var.value, 1, 15) .. "... "
        end
        return " " .. var.value
      end
    }
  end,
  keys = {
    { '<leader>bb', function() require("dap").toggle_breakpoint() end,                                   desc = 'Toggle [B]reakpoint',          mode = "n" },
    { '<leader>bc', function() require("dap").set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, desc = 'Set [C]onditional Breakpoint', mode = "n" },
    { '<leader>b?', function() require("dapui").eval(nil, { enter = true }) end,                         desc = 'Read value at cursor',         mode = "n" },
    { '<leader>td', function() require("dapui").toggle() end,                                            desc = 'Toggle [D]ebugger View',       mode = "n" },
    { '<F2>',       function() require("dap").continue() end,                                            desc = 'Continue',                     mode = "n" },
    { '<F3>',       function() require("dap").restart() end,                                             desc = 'Restart',                      mode = "n" },
    { '<F4>',       function() require("dap").step_over() end,                                           desc = 'Step Over (Next)',             mode = "n" },
    { '<F5>',       function() require("dap").step_into() end,                                           desc = 'Step Into',                    mode = "n" },
    { '<F6>',       function() require("dap").step_out() end,                                            desc = 'Step Out',                     mode = "n" },
    { '<F7>',       function() require("dap").run_to_cursor() end,                                       desc = 'Run up to cursor',             mode = "n" },
    { '<F8>',       function() require("dap").step_back() end,                                           desc = 'Step Back',                    mode = "n" },
  }
}
