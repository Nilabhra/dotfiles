local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua.with({
					extra_args = {
						"--indent_type",
						"Spaces",
						"--indent_width",
						"2",
					},
				}),
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort.with({
					args = {
						"--profile",
						"black",
						"--stdout",
						"--filename",
						"$FILENAME",
						"-",
					},
				}),
				-- null_ls.builtins.formatting.ruff,
			},

			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
