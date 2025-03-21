return {
  {
    "folke/zen-mode.nvim",
    keys = {
      {
        "<leader>z",
        function()
          require("zen-mode").toggle()
        end,
        desc = "Toggle [Z]enMode",
      },
    },
    opts = {
      window = {
        width = 100,
      },
      plugins = {
        options = {
          laststatus = 3,
        },
      },
    },
  },
}
