return {
  {
    "yetone/avante.nvim",
    opts = {
      provider = "ollama",
      providers = {
        ollama = {
          endpoint = "http://127.0.0.11:11434",
          model = "qwen3.5:9b",
        },
      },
      selection = {
        hint_display = "none",
      },
      behaviour = {
        auto_set_keymaps = false,
      },
    },
  },
}
