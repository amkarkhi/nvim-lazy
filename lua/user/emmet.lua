vim.opt_global.user_emmet_install_global = 0
vim.cmd("FileType html,css,jsx EmmetInstall")

vim.api.nvim_create_autocmd("FileType", {
	pattern = { ".jsx", ".html", ".css" },
	callback = function()
		vim.cmd("EmmetInstall")
	end,
})
