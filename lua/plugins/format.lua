return {
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true })
        end,
        desc = "[F]ormat",
      },
    },
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofmt" },
        javascript = { "prettier" },
        json = { "jq" },
        lua = { "stylua" },
        nix = { "nixfmt" },
        ocaml = { "ocamlformat" },
        php = { "php_cs_fixer" },
        rust = { "rustfmt" },
        yaml = { "yq" },
        blade = { "blade-formatter" },
        ["_"] = { "trim_whitespace", "trim_newlines" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_on_save = {
        timeout_ms = 500,
      },
    },
    init = function()
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
}
