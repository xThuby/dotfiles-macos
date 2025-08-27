return {
	"hrsh7th/nvim-cmp",
	commit = "b356f2c",
	pin = true,
	event = "InsertEnter",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp-signature-help", opt = {} }, -- source for function signatures
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<S-space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				-- { name = "copilot" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lsp" },
				{ name = "path" }, -- file system paths
				{ name = "luasnip" }, -- snippets
				-- { name = "buffer" }, -- text within current buffer
			}),

			window = {
				completion = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					col_offset = -3,
					side_padding = 0,
				},
			},
			formatting = {
				expandable_indicator = false,
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "    (" .. (strings[2] or "") .. ")"

					return kind
				end,
			},

			-- configure lspkind for vs-code like pictograms in completion menu
			-- formatting = {
			-- 	expandable_indicator = false,
			-- 	format = lspkind.cmp_format({
			-- 		mode = "symbol_text",
			-- 		maxwidth = 50,
			-- 		ellipsis_char = "...",
			-- 	}),
			-- 	fields = { "kind", "abbr" },
			-- },
		})
	end,
}
