return {
  {
    "eboody/maud-fmt.nvim",
    config = function()
      require("maud-fmt").setup({
        indent_size = 4,
      })
    end,
    ft = "rust",
  },
}
