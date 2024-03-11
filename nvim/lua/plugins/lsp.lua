return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "ruff_lsp" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = { Lua = { diagnostics = { globals = { "vim" } } } },
			})

			-- Pyright setup:
			lspconfig.pyright.setup({
				-- on_attach = true,
				capabilities = capabilities,
				settings = {
					pyright = {
						autoImportCompletion = true,
						disableOrganizeImports = false,
						disableLanguageServices = false,
					},
					python = {
						analysis = {
							autoSearchPaths = true,
							diagnosticsMode = "workspace",
							useLibraryCodeForTypes = true,
							typeCheckingMode = "basic",
							-- ignore = { "*" }, -- I prefer Ruff to do this not Pywright.
						},
					},
				},
			})
			-- Ruff setup
			-- Enable completion triggered by <c-x><c-o>
			lspconfig.ruff_lsp.setup({
				settings = { organizeImports = false }, -- I don't like how Ruff formats the imports.
				on_attach = function(client, bufnr)
					client.server_capabilities.hoverProvider = false
					vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
				end,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set("n", "K", vim.lsp.buf.hover)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename)
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action)
			vim.keymap.set("n", "gr", vim.lsp.buf.references)
			vim.keymap.set("n", "<space>f", function()
				vim.lsp.buf.format({ async = true })
			end)
		end,
	},
}
