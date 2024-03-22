return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local cfg = require("nvim-treesitter.configs")
      local ensure_installed = { "lua", "python", "html", "c", "cpp" }
      local autoinstall = { autoinstall = true }
      local highlight = { enable = true }
      local indent = { enable = true }
      local opts = { ensure_installed, highlight, indent, autoinstall }
      cfg.setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
  },
}
