return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- { "hrsh7th/cmp-nvim-lsp-signature-help", opt = {} }, -- source for function signatures
		-- "hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
	},
	config = function()
		-- local cmp = require("cmp")

		-- cmp.setup({
		-- 	completion = {
		-- 		completeopt = "menu,menuone,preview,noselect",
		-- 	},
		-- 	mapping = cmp.mapping.preset.insert({
		-- 		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		-- 		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		-- 		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		-- 		["<C-f>"] = cmp.mapping.scroll_docs(4),
		-- 		["<S-space>"] = cmp.mapping.complete(), -- show completion suggestions
		-- 		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		-- 		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		-- 	}),
		-- 	-- sources for autocompletion
		-- 	sources = cmp.config.sources({
		-- 		-- { name = "copilot" },
		-- 		-- { name = "nvim_lsp_signature_help" },
  --               { name = "nvim_lsp" },
		-- 		{ name = "path" }, -- file system paths
  --               { name = "buffer" }, -- text within current buffer
		-- 	}),
		--
		-- 	window = {
		-- 		completion = {
		-- 			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
		-- 			col_offset = 0,
		-- 			side_padding = 0,
		-- 		},
		-- 	},
		-- })
	end,
}
