return {
	-- add any tools you want to have installed below
	{
		"mason-org/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"flake8",
				"css-lsp",
				"prettier",
				"cssmodules-language-server",
				"json-lsp",
				"lua-language-server",
				"prisma-language-server",
				"tailwindcss-language-server",
				"typescript-language-server",
				"html-lsp",
				"emmet-language-server",
				"yaml-language-server",
				"astro-language-server",
				"svelte-language-server",
				"vue-language-server",
			}
		end,
	},
}
