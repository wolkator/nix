-- Globals
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.showmode = false
vim.o.clipboard = "unnamedplus"
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.mouse = "a"
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.foldmethod = "indent"
vim.o.foldcolumn = "0"
vim.o.foldtext = ""
vim.o.foldlevelstart = 99
vim.o.foldnestmax = 5
vim.o.inccommand = "split"
vim.o.scrolloff = 10
vim.o.statusline = "%{%mode(1)%}  %f%m%r%= %{&filetype} %{&fileencoding} %l/%L %p%%"

-- Commands
vim.cmd.colorscheme(Colorscheme)

-- Autocommands
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.cursorline = false
		vim.cmd.startinsert()
	end,
})
