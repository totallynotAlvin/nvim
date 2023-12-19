local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
	lsp_zero.buffer_autoformat()

	-- -- code lens
	-- if client.resolved_capabilities.code_lens then
	-- 	local codelens = vim.api.nvim_create_augroup(
	-- 		'LSPCodeLens',
	-- 		{ clear = true }
	-- 	)
	-- 	vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave', 'CursorHold' }, {
	-- 		group = codelens,
	-- 		callback = function()
	-- 			vim.lsp.codelens.refresh()
	-- 		end,
	-- 		buffer = bufnr,
	-- 	})
	-- end
end)

lsp_zero.set_sign_icons({
	error = '✘',
	warn = '▲',
	hint = '⚑',
	info = '»'
})

lspconfig.lua_ls.setup({})
lspconfig.pyright.setup({})
lspconfig.ocamllsp.setup({
	capabilities =  capabilities,
	on_attach = on_attach,
	settings = {
		codelens = {enable = true},
	},
})
