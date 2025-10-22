return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	-- For blink.cmp's completion
	dependencies = {
		"saghen/blink.cmp"
	},
	{
		'brianhuster/live-preview.nvim',
		dependencies = {
			'nvim-telescope/telescope.nvim',
		},
	},
};
