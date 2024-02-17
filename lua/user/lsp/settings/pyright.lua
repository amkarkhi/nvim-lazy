local config = require("user.lsp.handlers")
local null_ls = require("user.lsp.null-ls")
local on_attach = config.on_attach
local capabilities = config.capabilities

return {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "python" },
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "on",
			},
		},
	},
	sources = {
		null_ls.diagnostics.mypy,
		null_ls.diagnostics.ruff,
		null_ls.diagnostics.black,
	},
}
