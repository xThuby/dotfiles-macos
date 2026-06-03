return {
	"nvim-telescope/telescope.nvim",
	-- branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		local live_grep_jai_modules = function()
			local opts = {}

			opts = {
				cwd = "~/jai/",
				search_dirs = { "modules/", "how_to/" },
			}

			builtin.live_grep(opts)
		end

		local grep_cursor_jai_modules = function()
			local opts = {}

			opts = {
				cwd = "~/jai/modules/",
			}

			builtin.grep_string(opts)
		end

		local find_files_jai_modules = function()
			local opts = {}

			opts = {
				cwd = "~/jai/",
				search_dirs = { "modules/", "how_to/" },
			}

			builtin.find_files(opts)
		end

		local live_grep_how_to_jai = function()
			local opts = {}

			opts = {
				cwd = "~/jai/",
				search_dirs = { "how_to/" },
			}

			builtin.live_grep(opts)
		end

		telescope.setup({
			defaults = {
                wrap_results = true,
				file_ignore_patterns = {
					".meta",
					".png",
					-- ".asset",
					".mp3",
					".zip",
					".prefab",
					"Runner",
					"External",
					"Plugins",
					"Library",
				},
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
					},
					n = {
						["<leader>qa"] = actions.send_to_qflist,
						["<leader>qs"] = actions.send_selected_to_qflist,
					},
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--trim",
				},
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "--color", "never" },
				},
			},
			extensions = {
				fzf = {},
			},
		})

        vim.api.nvim_create_autocmd("User", {
            pattern = "TelescopePreviewerLoaded",
            callback = function(_)
                vim.wo.wrap = true
            end,
        })

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		-- keymap.set("n", "<D-p>", project_files, { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<D-p>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<D-b>", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find files in buffers" })
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>", { desc = "Find marks" })
		keymap.set("n", "<leader>fjs", live_grep_jai_modules, { desc = "Live grep in jai modules" })
		keymap.set("n", "<leader>fjc", grep_cursor_jai_modules, { desc = "Find string under cursor in jai modules" })
		keymap.set("n", "<leader>fjf", find_files_jai_modules, { desc = "Fuzzy find files in jai modules" })
		keymap.set("n", "<leader>fjh", live_grep_how_to_jai, { desc = "Live grep in jai how_tos" })
		keymap.set(
			"n",
			"<leader>uC",
			"<cmd>Telescope colorscheme enable_preview=true<cr>",
			{ desc = "Colorscheme with preview" }
		)
	end,
}
