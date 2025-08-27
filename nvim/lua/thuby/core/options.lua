vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.colorcolumn = "100"

opt.scrolloff = 24
opt.sidescrolloff = 24

vim.filetype.add({
	extension = {
		hlsl = "hlsl",
		shader = "hlsl",
	},
})

if vim.g.neovide then
	local gui_font_size = 14
	local default_font_size = 14
	local gui_font = "JetBrainsMonoNL Nerd Font"

	function AdjustFontSize(amount)
		gui_font_size = gui_font_size + amount
		if amount == 0 then
			gui_font_size = default_font_size
		end
		vim.o.guifont = gui_font .. ":h" .. gui_font_size
	end

	vim.o.guifont = gui_font .. ":h" .. gui_font_size

	-- Disable animations
	-- vim.g.neovide_cursor_animation_length = 0
	-- vim.g.neovide_cursor_antialiasing = false
	-- vim.g.neovide_cursor_animate_in_insert_mode = false
	-- vim.g.neovide_cursor_animate_command_line = false
	-- vim.g.neovide_position_animation_length = 0
	-- vim.g.neovide_scroll_animation_length = 0
	-- vim.g.neovide_scroll_animation_far_lines = 0

	-- Speed up animations
	function SetAnimSpeedScale(scale)
		vim.g.neovide_position_animation_length = 0.15 * scale
		vim.g.neovide_scroll_animation_length = 0.3 * scale
		vim.g.neovide_cursor_animation_length = 0.13 * scale
	end

	local anim_speed_scale = 0
	SetAnimSpeedScale(anim_speed_scale)
end
