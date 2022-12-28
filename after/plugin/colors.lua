function ColorMyPencils (color)
	color = color or "onedark"
	vim.cmd.colorscheme(color)

	-- Set transparent background, doesn't seem to work on windows
	-- vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
	-- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

ColorMyPencils()
