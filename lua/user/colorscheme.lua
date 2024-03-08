require("user.colorschemes.tokyonight")
require("user.colorschemes.gruvbox")

local colorscheme = "tokyonight-night"
colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "solarized",
	callback = function()
		vim.api.nvim_set_hl(0, "CopilotSuggestion", {
			fg = "#ff0000",
			bg = "#268bd2",
			ctermfg = 8,
			force = true,
		})
	end,
})
