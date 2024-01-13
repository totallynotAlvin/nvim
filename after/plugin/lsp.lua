local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')
local util = require "lspconfig/util"
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
	lsp_zero.buffer_autoformat()
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opt)

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

lsp_zero.setup_servers({ 'lua_ls', 'pyright', 'ruff_lsp', 'tsserver', })

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
	mapping = cmp.mapping.preset.insert({
		['<Tab>'] = cmp_action.luasnip_supertab(),
		['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
	}),
})


lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			}
		}
	}
})

lspconfig.ocamllsp.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		codelens = { enable = true },
	},
})
