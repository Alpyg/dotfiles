return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      parser_config = {
        wgsl = {
          install_info = {
            url = "https://github.com/szebniok/tree-sitter-wgsl",
            files = { "src/parser.c" },
          },
        },
      },
      ensure_installed = { "wgsl" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        zls = {},
      },
    },
  },
}
