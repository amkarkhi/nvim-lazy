return {
	cmd = { "csharp-ls" },
	filetypes = { "cs" },
	init_options = {
		AutomaticWorkspaceInit = true,
	},
	root_dir = function(fname)
		return require("lspconfig").util.root_pattern("*.sln", "*.csproj", "packages.config")(fname)
			or vim.loop.os_homedir()
	end,
}
