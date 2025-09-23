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

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					".meta",
					".png",
					".asset",
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
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
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
					"--trim",
				},
			},
		})

		telescope.load_extension("fzf")

		-- We cache the results of "git rev-parse"
		-- Process creation is expensive in Windows, so this reduces latency
		local is_inside_work_tree = {}

		local project_files = function()
			local opts = {} -- define here if you want to define something

			local cwd = vim.fn.getcwd()
			if is_inside_work_tree[cwd] == nil then
				vim.fn.system("git rev-parse --is-inside-work-tree")
				is_inside_work_tree[cwd] = vim.v.shell_error == 0
			end

			if is_inside_work_tree[cwd] then
				require("telescope.builtin").git_files(opts)
			else
				require("telescope.builtin").find_files(opts)
			end
		end

		local live_grep_jai_modules = function()
			local opts = {}

			opts = {
				cwd = "~/jai/modules/",
			}

			require("telescope.builtin").live_grep(opts)
		end

		local grep_cursor_jai_modules = function()
			local opts = {}

			opts = {
				cwd = "~/jai/modules/",
			}

			require("telescope.builtin").grep_string(opts)
		end

		local find_files_jai_modules = function()
			local opts = {}

			opts = {
				cwd = "~/jai/modules/",
			}

			require("telescope.builtin").find_files(opts)
		end

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<D-p>", project_files, { desc = "Fuzzy find files in cwd" })
		-- keymap.set("n", "<D-p>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
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
	end,
}
