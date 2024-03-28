return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = function()
      local map_opts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap("n", "<leader>lg", ":ToggleTerm direction=float<CR>lazygit && exit<CR>", map_opts)
      vim.api.nvim_set_keymap("n", "<C-t>", ":ToggleTerm direction=horizontal<CR>", map_opts)
    end,
    config = true,
  },
}
