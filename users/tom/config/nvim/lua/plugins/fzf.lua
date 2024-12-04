return {
	{
		"ibhagwan/fzf-lua",
		lazy = false,
		opts = {
			"fzf-native",
			keymap = {
				fzf = {
					["ctrl-q"] = "select-all+accept",
				},
			},
		},
		keys = {
			{ "<leader>s", "<cmd>FzfLua builtin<cr>", desc = "Fzf" },
			{ "<leader>f", "<cmd>FzfLua files<cr>", desc = "Files" },
			{ "<leader>b", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
			{ "<leader>o", "<cmd>FzfLua oldfiles<cr>", desc = "Old files" },
			{ "<leader>h", "<cmd>FzfLua help_tags<cr>", desc = "Help" },
			{ "<leader>g", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
			{ "<leader>/", "<cmd>FzfLua grep_curbuf<cr>", desc = "Buffer" },
			{
				"<leader>n",
				function()
					require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Config files",
			},
		},
	},
}
