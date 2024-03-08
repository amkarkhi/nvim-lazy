local copilot_status_ok, chat = pcall(require, "CopilotChat")

if not copilot_status_ok then
	return
end

chat.setup({
	separator = "-----------------%%%%%%%%%-----------------%",
})

local function open_chat_float()
	chat.open({
		window = {
			layout = "float",
			title = "Copilot Chat",
			width = 0.8,
			border = "rounded",
			height = 0.8,
		},
	})
end

local actions = require("CopilotChat.actions")

local function help_actions()
	require("CopilotChat.integrations.telescope").pick(actions.help_actions())
end

local function search_prompts()
	require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end

local function ask_question()
	local question = require("telescope.builtin").input({
		prompt_title = "Ask a question",
		prompt_prefix = "❓ ",
	})
	if question then
		chat.ask(question)
	else
		question = "Explain how it works."
	end
	chat.ask(question, {
		selection = require("CopilotChat.select").buffer,
	})
end

local function is_chat_open()
	local buffers = vim.api.nvim_list_bufs()
	for _, buf in ipairs(buffers) do
		local file_name = (vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t"))
		if vim.api.nvim_buf_is_loaded(buf) and file_name == "copilotChat.lua" then
			return true
		end
	end
	return false
end
is_chat_open()

local function open_or_toggle_chat()
	if is_chat_open() then
		chat.toggle()
	else
		chat.open({
			window = {
				title = "Copilot Chat",
				width = 0.8,
				border = "rounded",
				height = 0.8,
			},
		})
	end
end

local function chat_in_place()
	local input = vim.fn.input("Chat in place: ")
	if input ~= "" then
		require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
	end
end

local function chat_in_place_selected()
	local input = vim.fn.input("Chat in place: ")
	if input ~= "" then
		require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
	end
end

local opts = { noremap = true, silent = true }
local function keyBindings()
	vim.keymap.set("i", "<leader>]", "<Plug>(copilot-next)", opts)
	vim.keymap.set("i", "<leader>[", "<Plug>(copilot-previous)", opts)
	vim.keymap.set("i", "<leader>/", "<Plug>(copilot-suggest)", opts)
	vim.keymap.set("i", "<leader>q", "<Plug>(copilot-ask)", opts)
	vim.keymap.set("i", "<M-l>", "<Plug>(copilot-accept-word)", opts)
	-- open chat
	vim.keymap.set("n", "<leader>ms", open_or_toggle_chat, opts)
	-- open chat Float
	vim.keymap.set("n", "<leader>mf", open_chat_float, opts)
	vim.keymap.set("n", "<leader>mp", search_prompts, opts)
	vim.keymap.set("n", "<leader>mq", ask_question, opts)
	vim.keymap.set("n", "<leader>mh", help_actions, opts)
	vim.keymap.set("n", "<leader>mq", chat_in_place, opts)
	vim.keymap.set("v", "<leader>mq", chat_in_place_selected, opts)
end

keyBindings()
