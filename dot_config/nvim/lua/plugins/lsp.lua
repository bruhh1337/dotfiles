return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "lua_ls",
      "marksman",
      "tinymist",
      "pyright",
      "bashls",
    },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig", },
  vim.lsp.config("tinymist", {
    settings = {
      formatterMode = "typstyle"
    }
  }),
  vim.lsp.config("lua_ls", {
    settings = {
      Lua = {
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        }
      }
    }
  })
}
