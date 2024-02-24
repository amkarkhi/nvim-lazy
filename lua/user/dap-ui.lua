local dap, dapui = require("dap"), require("dapui")

dapui.setup({
	icons = {
		expanded = "▾",
		collapsed = "▸",
		circular = "●",
	},
	mappings = {
		expand = { "<CR>" },
		open = "o",
		remove = "d",
		edit = "e",
	},
	sidebar = {
		elements = {
			"scopes",
			"breakpoints",
			"stacks",
			"watches",
		},
		width = 40,
		position = "left", -- Can be "left" or "right"
	},
})

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
