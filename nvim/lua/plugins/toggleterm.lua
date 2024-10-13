return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = function()
      local map_opts = { noremap = true, silent = true }
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
      local float_shell = Terminal:new({ cmd = "zsh", hidden = false, direction = "float" })

      function _lazygit_toggle()
        lazygit:toggle()
      end

      function _float_shell_toggle()
        float_shell:toggle()
      end

      vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", map_opts)
      vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua _float_shell_toggle()<CR>", map_opts)
    end,
    config = true,
  },
}
