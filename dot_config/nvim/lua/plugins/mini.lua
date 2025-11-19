return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  -- {
  --   'nvim-mini/mini.pairs',
  --   version = false,
  --   config = function()
  --     require("mini.pairs").setup()
  --   end
  -- },
  {
    'nvim-mini/mini.surround',
    version = false,
    config = function()
      require("mini.surround").setup()
    end
  },
  {
    'nvim-mini/mini.ai',
    version = false,
    config = function()
      require("mini.ai").setup()
    end
  },
}
