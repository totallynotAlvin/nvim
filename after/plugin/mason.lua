require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = {"tsserver", "lua_ls", "pyright"},
	automatic_installation = true,
}
