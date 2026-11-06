return {
  {
    "jellydn/tiny-term.nvim",
    dependencies = { "folke/snacks.nvim" },
    lazy = false,
    opts = {
      -- Mantém compatibilidade com os atalhos e integrações do LazyVim.
      override_snacks = true,
      win = {
        position = "bottom",
        split_size = 15,
        stack = true,
      },
      start_insert = true,
      auto_insert = true,
      auto_close = true,
    },
  },
}
