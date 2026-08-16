return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = function(_, opts)
			opts = opts or {}
			opts.window = opts.window or {}
			opts.window.mappings = opts.window.mappings or {}
			opts.window.mappings.o = "open"
			opts.window.width = 25
			opts.filesystem = opts.filesystem or {}
			opts.filesystem.window = opts.filesystem.window or {}
			opts.filesystem.window.mappings = opts.filesystem.window.mappings or {}
			opts.filesystem.window.mappings.o = "open"
			return opts
		end,
	},
}
