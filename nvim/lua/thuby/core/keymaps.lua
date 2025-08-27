vim.g.mapleader = " "

local km = vim.keymap

km.set("n", "<ESC>", ":nohl<CR>", { desc = "Clear search highlights", silent = true })

km.set("n", "<leader>+", "<C-a>", { desc = "Increment number", silent = true })
km.set("n", "<leader>-", "<C-x>", { desc = "Decrement number", silent = true })

km.set("n", "<leader>1", ":only<CR>", { desc = "Close all but current split", silent = true })
km.set("n", "<leader>2", "<C-w>s", { desc = "Split horizontally", silent = true })
km.set("n", "<leader>3", "<C-w>v", { desc = "Split vertically", silent = true })
km.set("n", "<leader>0", ":close<CR>", { desc = "Close current split", silent = true })
km.set("n", "<leader>=", "<C-w>=", { desc = "Equalise splits", silent = true })


if vim.g.neovide then
    km.set("n", "<leader>f+", function() AdjustFontSize(1) end, { desc = "Increases font size", silent = true })
    km.set("n", "<leader>f-", function() AdjustFontSize(-1) end, { desc = "Decreases font size", silent = true })
    km.set("n", "<leader>f=", function() AdjustFontSize(0) end, { desc = "Resets font size to default (14)", silent = true })
end
