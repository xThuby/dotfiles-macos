return {
	"seblyng/roslyn.nvim",
	ft = "cs",
	---@module 'roslyn.config'
	---@type RoslynNvimConfig
	opts = {
        lock_target = true,
        -- Let roslyn's own server handle file watching instead of Neovim's
        -- built-in client-side watcher, which is slow on large solutions
        -- (especially on Windows). See roslyn.nvim README for details.
        filewatching = "roslyn",
	},
}
