return {
  "karb94/neoscroll.nvim",
  opts = {
    easing = "sine",
  },
  config = function(_, opts)
    local neoscroll = require("neoscroll")
    neoscroll.setup(opts)

    local function scroll(lines)
      local mouse_winid = vim.fn.getmousepos().winid
      neoscroll.scroll(lines, {
        duration = 100,
        easing = "sine",
        move_cursor = false,
        winid = mouse_winid > 0 and mouse_winid or 0,
      })
    end

    local modes = { "n", "v", "x", "i" }
    vim.keymap.set(modes, "<ScrollWheelUp>", function()
      scroll(-3)
    end, { desc = "Smooth scroll up" })
    vim.keymap.set(modes, "<ScrollWheelDown>", function()
      scroll(3)
    end, { desc = "Smooth scroll down" })
  end,
}
