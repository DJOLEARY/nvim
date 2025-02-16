-- [[ Setting options ]]
-- See `:help vim.opt`

-- Set highlight on search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Make line numbers default
vim.opt.nu = true
vim.opt.relativenumber = true

-- Enable mouse for all modes
vim.o.mouse = "a"

-- Backup indentation rules
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Prevent cursor from leaving middle of screen (where possible)
vim.opt.scrolloff = 999

-- Editor columns
vim.opt.colorcolumn = {
  "80",
  "100",
}

-- Enable break indent
vim.o.breakindent = true

-- Disable swap files
vim.opt.swapfile = false

-- Disable backup files
vim.opt.backup = false

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250

-- Enable sign column
vim.wo.signcolumn = "yes"

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

--
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

-- NetRW Settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_altv = 1
