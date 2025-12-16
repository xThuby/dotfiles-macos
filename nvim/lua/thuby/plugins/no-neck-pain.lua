return {
    "shortcuts/no-neck-pain.nvim",
	opts = {
		width = 150,
		autocmds = {
			enableOnVimEnter = "safe",
		},
		mappings = {
			enabled = true,
		},
		buffers = {
			right = {
				enabled = false,
			},
			scratchPad = {
				enabled = true,
				fileName = "notes",
				location = "~/",
			},
			bo = {
				filetype = "md",
			},
		},
	},
}
