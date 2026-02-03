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

km.set("v", "J", ":m '>+1<CR>gv=gv")
km.set("v", "K", ":m '>-2<CR>gv=gv")

km.set("n", "J", "mzJ`z")
km.set("n", "<C-d>", "<C-d>zz")
km.set("n", "<C-u>", "<C-u>zz")
km.set("n", "n", "nzzzv")
km.set("n", "N", "Nzzzv")

-- km.set("x", "<leader>p", "\"_dP")
km.set("v", "p", "\"_dP")

km.set("n", "<leader>d", "\"_d")
km.set("v", "<leader>d", "\"_d")

km.set("n", "<D-k>", "<cmd>cnext<CR>zz")
km.set("n", "<D-j>", "<cmd>cprev<CR>zz")
km.set("n", "<leader>k", "<cmd>lnext<CR>zz")
km.set("n", "<leader>j", "<cmd>lprev<CR>zz")

km.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>")

if vim.g.neovide then
    km.set("n", "<leader>f+", function() AdjustFontSize(1) end, { desc = "Increases font size", silent = true })
    km.set("n", "<leader>f-", function() AdjustFontSize(-1) end, { desc = "Decreases font size", silent = true })
    km.set("n", "<leader>f=", function() AdjustFontSize(0) end, { desc = "Resets font size to default (14)", silent = true })
end
