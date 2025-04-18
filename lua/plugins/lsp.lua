return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            "nvim-dap-ui",
          },
        },
      },
      "saghen/blink.cmp",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      servers = {
        gopls = {},
        helm_ls = {},
        intelephense = {
          settings = {
            intelephense = {
              environment = {
                phpVersion = "8.0.29",
              },
            },
          },
        },
        lua_ls = {},
        nil_ls = {},
        ocamllsp = {},
        yamlls = {},
      },
    },
    config = function(_, opts)
      local lsp = require("lspconfig")

      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lsp[server].setup(config)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then
            return
          end

          local telescope = require("telescope.builtin")

          -- Formatting handled by conform.nvim

          if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
          end

          if client:supports_method("textDocument/codeAction") then
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
          end

          if client:supports_method("textDocument/rename") then
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
          end

          if client:supports_method("textDocument/definition") then
            vim.keymap.set("n", "gd", telescope.lsp_definitions, { desc = "[G]o to [D]efinition" })
          end

          if client:supports_method("textDocument/references") then
            vim.keymap.set("n", "gr", telescope.lsp_references, { desc = "[G]o to [R]eferences" })
          end

          if client:supports_method("textDocument/implementation") then
            vim.keymap.set("n", "gI", telescope.lsp_implementations, { desc = "[G]o to [I]mplementations" })
          end

          if client:supports_method("textDocument/prepareTypeHierarchy") then
            vim.keymap.set("n", "<leader>th", vim.lsp.buf.typehierarchy, { desc = "[T]ype[H]ierarchy" })
          end
        end,
      })

      vim.diagnostic.config({ virtual_lines = { current_line = true } })
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    ft = "rust",
  },
}
