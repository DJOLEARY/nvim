vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.lsp.inlay_hint.enable()

    vim.keymap.set("n", "<leader>ca", function()
      vim.cmd.RustLsp("codeAction")
    end, { desc = "[C]ode [A]ction", silent = true, buffer = args.buf })

    vim.keymap.set("n", "K", function()
      vim.cmd.RustLsp({ "hover", "actions" })
    end, { silent = true, buffer = args.buf })
  end,
})
