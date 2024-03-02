require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = { "tsserver", "lua_ls", "pyright", "elixir-ls", "ocaml-lsp", "gopls" },
	automatic_installation = true,
}
