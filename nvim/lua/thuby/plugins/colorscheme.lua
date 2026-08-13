return {
	{
		"deparr/tairiki.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tairiki").setup({
				palette = "dark",
				transparent = true, -- don't set background colors
				end_of_buffer = true, -- show end of buffer filler lines (tildes)
				visual_bold = true, -- bolden visual selections
				cmp_itemkind_reverse = true, -- reverse fg/bg on nvim-cmp item kinds
	
				-- which plugins to enable
				plugins = {
					auto = true, -- auto detect installed plugins, currently lazy.nvim only
	
					-- or enable/disable plugins manually
					-- see lua/tairiki/groups/init.lua for the full list of available plugins
					-- either the key or value from the M.plugins table can be used as the key here
					--
					-- setting a specific plugin manually overrides `all` and `auto`
					treesitter = true,
					cmp = true,
					nvim_tree = true,
					telescope = true,
				},
	
				-- optional function to modify or add colors to the palette
				-- palette definitions are in lua/tairiki/palette
				colors = function(c, opts)
					c.comment = "#6DBA67"
				end,
	
				-- optional function to override highlight groups
				highlights = function(groups, colors, opts) end,
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			local bg = "#011628"
			local bg_dark = "#011423"
			local bg_highlight = "#143652"
			local bg_search = "#0A64AC"
			local bg_visual = "#275378"
			local fg = "#CBE0F0"
			local fg_dark = "#B4D0E9"
			local fg_gutter = "#627E97"
			local border = "#547998"
			local comment = "#EAEA56"
	
			require("tokyonight").setup({
				style = "night",
				on_colors = function(colors)
					colors.bg = bg
					colors.bg_dark = bg_dark
					colors.bg_float = bg_dark
					colors.bg_highlight = bg_highlight
					colors.bg_popup = bg_dark
					colors.bg_search = bg_search
					colors.bg_sidebar = bg_dark
					colors.bg_statusline = bg_dark
					colors.bg_visual = bg_visual
					colors.border = border
					colors.fg = fg
					colors.fg_dark = fg_dark
					colors.fg_float = fg
					colors.fg_gutter = fg_gutter
					colors.fg_sidebar = fg_dark
					colors.comment = comment
				end,
			})


            -- vim.cmd("colorscheme tokyonight")
		end,
	},
    {
        "xThuby/murabox",
        lazy = false,
        priority = 1000,
        opts = {
            preproc = "bright",
        },
        config = function(_, opts)
            require("murabox").setup(opts)
            vim.cmd.colorscheme("murabox")

            vim.api.nvim_set_hl(0, "SnacksPicker", { link = "Normal" })
            vim.api.nvim_set_hl(0, "SnacksPickerFile", { link = "Normal" })
            vim.api.nvim_set_hl(0, "SnacksPickerDir", { link = "Comment" })
            vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { link = "Comment" })
            vim.api.nvim_set_hl(0, "SnacksPickerPathIgnored", { link = "Comment" })
        end,
    }
    -- {
	-- 	"CreaturePhil/vim-handmade-hero",
	-- 	lazy = false,
	-- 	priority = 1000,
        -- config = function()
            -- vim.cmd("colorscheme handmade-hero")
            -- -- vim.cmd("colorscheme sorbet")

            -- vim.api.nvim_set_hl(0, "MyCursor", { bg = "#40FF40" })
            -- vim.opt.guicursor = "n-v-c-i:block-MyCursor"

            -- vim.api.nvim_set_hl(0, "Normal", { fg = "#A08563", bg = "#191919" })
            -- vim.api.nvim_set_hl(0, "NonText", { fg = "#7D7D7D", bg = "#191919" })
            -- vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#7D7D7D", bg = "#191919" })

            -- vim.api.nvim_set_hl(0, "SnacksPicker", { link = "Normal" })
            -- vim.api.nvim_set_hl(0, "SnacksPickerFile", { link = "Normal" })
            -- vim.api.nvim_set_hl(0, "SnacksPickerDir", { link = "Comment" })
            -- vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { link = "Comment" })
            -- vim.api.nvim_set_hl(0, "SnacksPickerPathIgnored", { link = "Comment" })
        -- end,
    -- },
}
