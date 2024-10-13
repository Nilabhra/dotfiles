return {
  {
    "catppuccin/nvim",
    -- lazy = true,
    name = "catppuccin",
    pritority = 1000,
    -- config = function()
    -- 	vim.cmd.colorscheme("catppuccin-mocha")
    -- end,
    enabled = false,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      tokyonight_dark_float = false,
    },
    config = function()
      require("tokyonight").setup({
        dim_inactive = false,
      })
      vim.cmd.colorscheme("tokyonight-night")
    end,
    enabled = false,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function()
      require("kanagawa")
      vim.cmd.colorscheme("kanagawa")
    end,
    enabled = true,
  },
}
