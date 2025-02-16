return {
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    opts = {
      autocmds = {
        enableOnVimEnter = true,
        skipEnteringNoNeckPainBuffer = true,
      },
      buffers = {
        scratchPad = {},
        right = { enabled = false },
      },
    },
  }
}
