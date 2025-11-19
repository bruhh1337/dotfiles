return {
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = {
      "saghen/blink.cmp"
    },
    config = function()
      vim.keymap.set("n", "<leader>mv", "<Cmd>Markview toggle<CR>", { desc = "markview toggle" })
    end
  },
  {
    'brianhuster/live-preview.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
  },
  { "mason-org/mason.nvim", opts = {} }
};
