-- Based on lsp-zero.netlify.app/docs
return {
	{
		"folke/lazydev.nvim",
		lazy = false,
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/nvim-cmp",
		},
		lazy = false,
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"clangd",
					"clang-format",
					"lua-language-server",
					"nil",
					"stylua",
					"python-lsp-server",
					"autopep8",
					"black",
					"shfmt",
					"lemminx",
					"xmlformatter",
					"circleci-yaml-language-server",
					"yamlfmt",
				},
			})
			local lspconfig_defaults = require("lspconfig").util.default_config
			lspconfig_defaults.capabilities = vim.tbl_deep_extend(
				"force",
				lspconfig_defaults.capabilities,
				require("cmp_nvim_lsp").default_capabilities()
			)

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					map("K", "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover")
					map("gd", "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto definition")
					map("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto declaration")
					map("grt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type definition")
					map("grs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help")
				end,
			})

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							single_file_support = true,
						})
					end,
					nil_ls = function()
						require("lspconfig").nil_ls.setup({
							settings = {
								["nil"] = {
									formatting = {
										command = { "nixfmt" },
									},
								},
							},
						})
					end,
				},
			})
		end,
	},
}
