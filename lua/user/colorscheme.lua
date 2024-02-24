require("user.colorschemes.tokyonight")
require("user.colorschemes.gruvbox")

local colorscheme = "tokyonight-night"
colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
