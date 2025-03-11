return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    opts = {
      pickers = {
        find_files = {
          theme = "ivy",
        },
        live_grep = {
          theme = "ivy",
        },
        buffers = {
          theme = "dropdown",
        },
        help_tags = {
          theme = "ivy",
        },
      },
      extensions = {
        fzf = {},
      },
    },
    config = function()
      require("telescope").load_extension("fzf")

      local builtins = require("telescope.builtin")

      vim.keymap.set("n", "<leader>sb", builtins.buffers, { desc = "[S]earch [B]uffers" })
      vim.keymap.set("n", "<leader>sc", function()
        builtins.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "[S]earch [C]onfig" })
      vim.keymap.set("n", "<leader>sf", function()
        builtins.find_files({ hidden = true, no_ignore = true })
      end, { desc = "[S]earch [F]iles" })
      vim.keymap.set("n", "<leader>sg", builtins.git_files, { desc = "[S]earch Tracked [G]it Files" })
      vim.keymap.set("n", "<leader>sh", builtins.help_tags, { desc = "[S]earch [H]elp" })
      vim.keymap.set("n", "<leader>sk", builtins.keymaps, { desc = "[S]earch [K]eymaps" })
      vim.keymap.set("n", "<leader>so", function()
        builtins.find_files({
          cwd = "~/personal/idle_thoughts",
        })
      end, { desc = "[S]earch [O]bsidian" })
      vim.keymap.set("n", "<leader>ss", builtins.live_grep, { desc = "[S]earch [S]tring" })
    end,
  },
}
