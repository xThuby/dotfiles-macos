return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	-- event = { "BufReadPre", "BufNewFile" },
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter")

		-- configure treesitter
		treesitter.setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})
		treesitter.install({
			"json",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"html",
			"css",
			"prisma",
			"markdown",
			"markdown_inline",
			"svelte",
			"graphql",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"query",
			"vimdoc",
			"c",
			"odin",
			"astro",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "astro", "lua", "hlsl" },
			callback = function()
				vim.treesitter.start()
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				-- indentation, provided by nvim-treesitter
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
