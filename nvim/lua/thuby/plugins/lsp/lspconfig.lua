return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		-- "hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/lazydev.nvim", opts = {} },
	},
	config = function()
        --vim.lsp.log.set_level(vim.log.levels.DEBUG);
		-- import cmp-nvim-lsp plugin
		-- local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

        -- Disable highlighting from LSP
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client then
                    client.server_capabilities.semanticTokensProvider = nil
                end
            end,
        })

		-- used to enable autocompletion (assign to every lsp server config)
		-- local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		-- for type, icon in pairs(signs) do
		-- 	local hl = "DiagnosticSign" .. type
		-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		-- end

		vim.lsp.config("lua_ls", {
			-- capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = {
							"vim",
							"require",
						},
					},
				},
			},
		})
		vim.lsp.config("astro", {
			-- capabilities = capabilities,
			filetypes = { "astro" },
		})
		vim.lsp.config("rust_analyzer", {
			-- capabilities = capabilities,
		})
		-- vim.lsp.config("csharp_ls", {
		-- 	capabilities = capabilities,
		-- })

		vim.lsp.config("roslyn", {
            -- capabilities = {
            --     workspace = {
            --         didChangeWatchedFiles = {
            --             dynamicRegistration = false,
            --         }
            --     }
            -- },
			on_attach = function()
				vim.lsp.inlay_hint.enable(false)
			end,
			settings = {
				["csharp|background_analysis"] = {
                    -- Scope background analysis to open files instead of the
                    -- whole solution to keep edits/renames responsive.
                    dotnet_analyzer_diagnostics_scope = "openFiles",
                    dotnet_compiler_diagnostics_scope = "openFiles",
                },
				["csharp|code_lens"] = {
                    dotnet_provide_regex_completions = false,
					dotnet_enable_references_code_lens = false,
                    dotnet_show_name_completion_suggestions = false,
				},
				["csharp|completion"] = {
					dotnet_show_completion_items_from_unimported_namespaces = false,
				},
				["csharp|formatting"] = {
					dotnet_organize_imports_on_format = true,
				},
				["csharp|symbol_search"] = {
					dotnet_search_reference_assemblies = true,
                },
            },
        })

        vim.lsp.config("jails", {
            -- capabilities = capabilities,
            cmd = { "C:\\Jails\\bin\\jails" },
            filetypes = { "jai" },
            root_markers = { ".git", "build.jai", "first.jai", "jails.json", "modules" },
        })

        vim.lsp.enable("jails")

        -- vim.diagnostic.enable(false)
    end,
}
