vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.guicursor = ""
opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true
opt.autoindent = false

opt.swapfile = false
opt.autoread = true
opt.backup = true
vim.opt.directory = vim.fn.expand("$HOME/tmp/nvim/swap//")
vim.opt.backupdir = vim.fn.expand("$HOME/tmp/nvim/backup//")

opt.wrap = true

opt.ignorecase = true
opt.smartcase = true

opt.hlsearch = true
opt.incsearch = true

opt.cursorline = true

opt.termguicolors = true
-- opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.colorcolumn = "100"

opt.scroll = 24
opt.scrolloff = 5
opt.sidescrolloff = 24

vim.filetype.add({
	extension = {
		hlsl = "hlsl",
		shader = "hlsl",
	},
})

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

if vim.g.neovide then
	local nv = vim.g

	local gui_font_size = 10
	local default_font_size = 10
	local gui_font = "JetBrainsMonoNL Nerd Font"

	function AdjustFontSize(amount)
		gui_font_size = gui_font_size + amount
		if amount == 0 then
			gui_font_size = default_font_size
		end
		vim.o.guifont = gui_font .. ":h" .. gui_font_size
	end

	vim.o.guifont = gui_font .. ":h" .. gui_font_size

	nv.neovide_opacity = 1 -- 0.85
	nv.neovide_normal_opacity = 1 --0.85
	nv.neovide_window_blurred = false -- true

	nv.neovide_hide_mouse_when_typing = true

	-- Disable animations
	-- nv.neovide_cursor_animation_length = 0
	-- nv.neovide_cursor_antialiasing = false
	-- nv.neovide_cursor_animate_in_insert_mode = false
	-- nv.neovide_cursor_animate_command_line = false
	-- nv.neovide_position_animation_length = 0
	-- nv.neovide_scroll_animation_length = 0
	-- nv.neovide_scroll_animation_far_lines = 0

	-- Speed up animations
	function SetAnimSpeedScale(scale)
		nv.neovide_position_animation_length = 0.15 * scale
		nv.neovide_scroll_animation_length = 0.3 * scale
		nv.neovide_cursor_animation_length = 0.13 * scale
	end

	local anim_speed_scale = 0
	SetAnimSpeedScale(anim_speed_scale)
end
