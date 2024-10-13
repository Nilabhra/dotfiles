local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {

        -- Lua formatting
        null_ls.builtins.formatting.stylua.with({
          extra_args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
            "--quote-style",
            "ForceDouble",
          },
        }),

        -- Python import organisation
        -- This is commented out as Ruff is being used for
        -- sorting imports.
        -- null_ls.builtins.formatting.isort.with({
        --   args = {
        --     "--profile",
        --     "black",
        --     "--stdout",
        --     "--filename",
        --     "$FILENAME",
        --     "-",
        --   },
        -- }),

        -- Python formatting
        null_ls.builtins.formatting.black,
        -- null_ls.builtins.formatting.ruff,
      },

      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
              vim.lsp.buf.code_action({
                context = {
                  only = { "source.organizeImports.ruff" },
                },
                apply = true,
              })
              vim.wait(200)
            end,
          })
          -- Organizing Python imports using Ruff.
          -- Disable this if isort is needed.
          -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
          --   pattern = { "*.py" },
          --   callback = function()
          --     vim.lsp.buf.code_action({
          --       context = {
          --         only = { "source.organizeImports.ruff" },
          --       },
          --       apply = true,
          --     })
          --     -- vim.lsp.buf.format({ async = true })
          --     vim.wait(100)
          --   end,
          -- })
        end
      end,
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
