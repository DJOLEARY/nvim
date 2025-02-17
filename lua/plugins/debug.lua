return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "[D]ebug []",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "[D]ebug []",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "[D]ebug []",
      },
      {
        "<F12>",
        function()
          require("dap").step_out()
        end,
        desc = "[D]ebug []",
      },
      {
        "<Leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "[D]ebug toggle [B]reakpoint",
      },
      {
        "<Leader>dB",
        function()
          require("dap").set_breakpoint()
        end,
        desc = "[D]ebug set [B]reakpoint",
      },
      {
        "<Leader>dl",
        function()
          require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
        end,
        desc = "[D]ebug [L]ogpoint",
      },
      {
        "<Leader>dr",
        function()
          require("dap").repl.open()
        end,
        desc = "[D]ebug [R]epl",
      },
      {
        "<Leader>drl",
        function()
          require("dap").run_last()
        end,
        desc = "[D]ebug [R]un [L]ast",
      },
      {
        "<Leader>dh",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "[D]ebug [H]over",
      },
      {
        "<Leader>dp",
        function()
          require("dap.ui.widgets").preview()
        end,
        desc = "[D]ebug [P]review",
      },
      {
        "<Leader>df",
        function()
          local widgets = require("dap.ui.widgets")
          widgets.centered_float(widgets.frames)
        end,
        desc = "[D]ebug [F]rames",
      },
      {
        "<Leader>ds",
        function()
          local widgets = require("dap.ui.widgets")
          widgets.centered_float(widgets.scopes)
        end,
        desc = "[D]ebug [S]copes",
      },
    },
    opts = {
      adapters = {
        ocamlearlybird = {
          type = "executable",
          command = "ocamlearlybird",
          args = { "debug" },
        },
        codelldb = {
          type = "executable",
          command = "codelldb",
        },
      },
      configs_by_ft = {
        ocaml = {
          {
            name = "OCaml Debug test.bc",
            type = "ocamlearlybird",
            request = "launch",
            program = "${workspaceFolder}/_build/default/test/test.bc",
          },
          {
            name = "OCaml Debug main.bc",
            type = "ocamlearlybird",
            request = "launch",
            program = "${workspaceFolder}/_build/default/bin/main.bc",
          },
        },
        rust = {
          {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
          },
        },
      },
    },
    config = function(_, opts)
      local dap = require("dap")

      for adapter, adapterConfig in pairs(opts.adapters) do
        dap.adapters[adapter] = adapterConfig
      end

      for filetype, filetypeConfig in pairs(opts.configs_by_ft) do
        dap.configurations[filetype] = filetypeConfig
      end
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    opts = {},
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    keys = {
      {
        "<leader>dt",
        function()
          require("dap-go").debug_test()
        end,
        desc = "[D]ebug [T]est",
      },
    },
    opts = {},
  },
}
