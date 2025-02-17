return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      {
        "<leader>tD",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "[T]rouble [D]iagnostics",
      },
      {
        "<leader>td",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "[T]rouble Buffer [D]iagnostics",
      },
    },
    opts = {},
  },
}
