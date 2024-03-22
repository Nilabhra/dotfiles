return {
  "hedyhli/outline.nvim",
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

    require("outline").setup({
      outline_window = {
        show_relative_numbers = true,
      },
      outline_items = {
        show_symbol_lineno = true,
      },
      preview_window = {
        auto_preview = false,
      },
    })
  end,
}
