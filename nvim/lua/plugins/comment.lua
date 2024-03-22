return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup({
      toggler = {
        line = "<leader>/",
        block = "<C-/>",
      },
      opleader = {
        line = "<leader>/",
        block = "<C-/>",
      },
    })
  end,
}
