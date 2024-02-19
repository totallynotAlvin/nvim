require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	integrations = {
		cmp = true,
		treesitter = true,
		leap = true,
		mason = true,
		telescope = {
			enabled = true,
		},
		native_lsp = {
			enabled = true,
			inlay_hints = {
				background = true
			}
		}
	}
})
vim.cmd.colorscheme "catppuccin"
