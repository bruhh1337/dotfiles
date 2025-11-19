return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    local base = require("notify.render.base")
    local notify = require("notify")

    local function compact_borderless(bufnr, notif, highlights)
      local namespace = base.namespace()
      local icon = "" --too lazy to refractor this
      local title = notif.title[1]

      if type(title) == "string" and notif.duplicates then
        title = string.format("%s x%d", title, #notif.duplicates)
      end

      local prefix
      if type(title) == "string" and #title > 0 then
        prefix = string.format("%s ::", title)
      else
        prefix = " "
      end

      local message = {
        string.format("%s %s", prefix, notif.message[1]),
        unpack(notif.message, 2),
      }

      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, message)

      local icon_length = #icon
      local prefix_length = #prefix

      vim.api.nvim_buf_set_extmark(bufnr, namespace, 0, 0, {
        hl_group = highlights.icon,
        end_col = icon_length + 1,
        priority = 50,
      })
      vim.api.nvim_buf_set_extmark(bufnr, namespace, 0, icon_length + 1, {
        hl_group = highlights.title,
        end_col = prefix_length + 1,
        priority = 50,
      })
      vim.api.nvim_buf_set_extmark(bufnr, namespace, 0, prefix_length + 1, {
        hl_group = highlights.body,
        end_line = #message,
        priority = 50,
      })
    end

    notify.setup({
      stages = "static",
      timeout = 3000,
      render = compact_borderless,

      on_open = function(win)
        vim.api.nvim_win_set_config(win, { border = "none" })
      end,
    })
    vim.notify = notify
  end
}
