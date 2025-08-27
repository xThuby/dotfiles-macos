return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "LspAttach",
	priority = 1000, -- needs to be loaded in first
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "classic",
			multilines = {
				enabled = true,
				always_show = true,
				trim_whitespaces = false, -- default
				tabstop = 4, -- default
			},
		})
		vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
	end,
}
