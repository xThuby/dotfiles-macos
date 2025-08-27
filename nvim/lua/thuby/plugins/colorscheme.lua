-- return {
-- 	"EdenEast/nightfox.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		local comment = "#6DBA67"
--
-- 		-- Default options
-- 		require("nightfox").setup({
-- 			options = {
-- 				styles = { -- Style to be applied to different syntax groups
-- 					comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
-- 					conditionals = "NONE",
-- 					constants = "NONE",
-- 					functions = "NONE",
-- 					keywords = "NONE",
-- 					numbers = "NONE",
-- 					operators = "NONE",
-- 					strings = "NONE",
-- 					types = "NONE",
-- 					variables = "NONE",
-- 				},
-- 				inverse = { -- Inverse highlight for different types
-- 					match_paren = false,
-- 					visual = false,
-- 					search = false,
-- 				},
-- 				modules = { -- List of various plugins and additional options
-- 					-- ...
-- 				},
-- 			},
-- 			palettes = {
-- 				all = {
-- 					comment = comment,
-- 				},
-- 			},
-- 			specs = {},
-- 			groups = {},
-- 		})
--
-- 		-- setup must be called before loading
-- 		vim.cmd("colorscheme nightfox")
-- 	end,
-- }
return {
	"deparr/tairiki.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local comment = "#6DBA67"

		require("tairiki").setup({
			-- which plugins to enable
			plugins = {
				auto = true, -- auto detect installed plugins, currently lazy.nvim only

				-- or enable/disable plugins manually
				-- see lua/tairiki/groups/init.lua for the full list of available plugins
				-- either the key or value from the M.plugins table can be used as the key here
				--
				-- setting a specific plugin manually overrides `all` and `auto`
				treesitter = true,
			},

			-- optional function to modify or add colors to the palette
			-- palette definitions are in lua/tairiki/palette
			colors = function(colors, opts)
				colors.comment = comment
			end,

			-- optional function to override highlight groups
			highlights = function(groups, colors, opts) end,
		})

		-- setup must be called before loading
		vim.cmd("colorscheme tairiki")
	end,
}
-- return {
-- 	"folke/tokyonight.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		local bg = "#011628"
-- 		local bg_dark = "#011423"
-- 		local bg_highlight = "#143652"
-- 		local bg_search = "#0A64AC"
-- 		local bg_visual = "#275378"
-- 		local fg = "#CBE0F0"
-- 		local fg_dark = "#B4D0E9"
-- 		local fg_gutter = "#627E97"
-- 		local border = "#547998"
-- 		local comment = "#EAEA56"
--
-- 		require("tokyonight").setup({
-- 			style = "night",
-- 			on_colors = function(colors)
-- 				colors.bg = bg
-- 				colors.bg_dark = bg_dark
-- 				colors.bg_float = bg_dark
-- 				colors.bg_highlight = bg_highlight
-- 				colors.bg_popup = bg_dark
-- 				colors.bg_search = bg_search
-- 				colors.bg_sidebar = bg_dark
-- 				colors.bg_statusline = bg_dark
-- 				colors.bg_visual = bg_visual
-- 				colors.border = border
-- 				colors.fg = fg
-- 				colors.fg_dark = fg_dark
-- 				colors.fg_float = fg
-- 				colors.fg_gutter = fg_gutter
-- 				colors.fg_sidebar = fg_dark
-- 				colors.comment = comment
-- 			end,
-- 		})
--
-- 		vim.cmd("colorscheme tokyonight")
-- 	end,
-- }
