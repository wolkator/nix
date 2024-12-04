-- Motions
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Windows
local winfocus = function(where, desc)
	vim.keymap.set({ "n", "t" }, "<c-" .. where .. ">", function()
		vim.cmd.wincmd(where)
		if vim.bo.buftype == "terminal" then
			vim.cmd.startinsert()
		end
	end, { desc = desc })
end
winfocus("h", "Focus left window")
winfocus("j", "Focus bottom window")
winfocus("k", "Focus top window")
winfocus("l", "Focus right window")

-- Misc
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<leader>xl", "<cmd>lua vim.diagnostic.setloclist()<cr>", { desc = "Send to location list" })
vim.keymap.set("n", "<leader>xq", "<cmd>lua vim.diagnostic.setqflist()<cr>", { desc = "Send to quickfix list" })
