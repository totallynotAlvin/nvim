local chadtree_settings = {
	theme = {
		icon_glyph_set = "ascii",
		icon_colour_set = "github",
		text_colour_set = "solarized_dark",
	}
}
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
vim.keymap.set("n", "<leader>pv", vim.cmd.CHADopen);
