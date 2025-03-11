return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon"):list():add()
        end,
        desc = "[Harpoon] [A]dd",
      },
      {
        "<leader>hl",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "[Harpoon] [L]ist",
      },
      {
        "<leader>h1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "[Harpoon] [1]st Window",
      },
      {
        "<leader>h2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "[Harpoon] [2]nd",
      },
      {
        "<leader>h3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "[Harpoon] [3]rd",
      },
      {
        "<leader>h4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "[Harpoon] [4]th",
      },
    },
    config = function()
      -- REQUIRED
      require("harpoon"):setup()
      -- REQUIRED
    end,
  },
}
