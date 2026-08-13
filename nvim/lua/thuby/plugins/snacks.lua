local jai_dir = "/Users/oliverandreasthunaes/jai/"

local excludes = {
    "*.o",
    "*.ico",
    "*.meta",
    "*.png",
    "*.mp3",
    "*.zip",
    "*.prefab",
    "*.otf",
    "*.ttf",
    "*.psd",
}
local excludes_jai = {
    "*.pbxproj",
}
local excludes_combined = vim.list_extend(vim.deepcopy(excludes), excludes_jai)

local function find_files_jai_modules()
    Snacks.picker.files({
        dirs = { jai_dir .. "modules", jai_dir .. "examples" },
        exclude = excludes_jai
    })
end

local function live_grep_jai_modules()
    Snacks.picker.grep({
        dirs = { jai_dir .. "modules", jai_dir .. "examples" },
        exclude = excludes_jai
    })
end

local function grep_cursor_jai_modules()
    Snacks.picker.grep_word({
        dirs = { jai_dir .. "modules", jai_dir .. "examples" },
        exclude = excludes_jai
    })
end

local function live_grep_how_to_jai()
    Snacks.picker.grep({
        dirs = { jai_dir .. "how_to" },
        exclude = excludes_jai
    })
end

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        explorer = {
            enabled = true
        },
        indent = {
            enabled = false,
            animate = {
                enabled = false
            },
            scope = {
                enabled = true,
                only_current = false,
            },
        },
        input = { enabled = true },
        notifier = { enabled = false },
        picker = {
            enabled = true,
            sources = {
                files = {
                    exclude = excludes,
                },
                grep = {
                    exclude = excludes,
                },
            },
        },
        quickfile = { enabled = true },
        rename = { enabled = false },
        scope = { enabled = false, },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
    },
    keys = {
        { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },

        -- find
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<M-p>",      function() Snacks.picker.files() end, desc = "Find Files" },
        { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },


        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
        { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
        { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        { "gi", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
        { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },

        -- Grep
        { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
        { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
        { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },

        --search
        { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
        { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
        { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
        { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        { "<leader>D",  function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
        { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
        { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
        { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
        { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
        { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
        { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
        { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
        { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
        { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
        { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
        { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
        { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
        { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },

        -- JAI search
        { "<leader>sjs", live_grep_jai_modules, desc = "Live grep in jai modules" },
        { "<leader>sjw", grep_cursor_jai_modules, desc = "Find string under cursor in jai modules" },
        { "<leader>fjf", find_files_jai_modules, desc = "Fuzzy find files in jai modules" },
        { "<leader>fjh", live_grep_how_to_jai, desc = "Live grep in jai how_tos" },
    },
}
