return {
	"chikko80/error-lens.nvim",
	event = "BufRead",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		enabled = false,
		auto_adjust = {
			enable = true,
			fallback_bg_color = "#281478", -- mandatory if enable true (e.g. #281478)
			step = 0, -- inc: colors should be brighter/darker
			total = 30, -- steps of blender
		},
		prefix = 0, -- distance code <-> diagnostic message
	},
}
