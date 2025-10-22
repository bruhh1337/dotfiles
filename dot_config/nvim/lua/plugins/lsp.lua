return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		--automatic_enable = false,
		ensure_installed = {
			"lua_ls",
			"marksman",
			"tinymist",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
