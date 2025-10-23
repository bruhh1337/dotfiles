return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "typst",
        "lua",
        "markdown",
        "scala",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      sync_install = true,
      auto_install = true,
    })
  end
}
