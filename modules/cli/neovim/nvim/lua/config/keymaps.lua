-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local unmap = vim.keymap.del

unmap("n", "<C-Up>")
unmap("n", "<C-Down>")
unmap("n", "<C-Left>")
unmap("n", "<C-Right>")
-- unmap("n", "<C-W>")

map("n", "<C-Up>", "<C-w>k", { desc = "Window Up", remap = true })
map("n", "<C-Down>", "<C-w>j", { desc = "Window Down", remap = true })
map("n", "<C-Left>", "<C-w>h", { desc = "Window Left", remap = true })
map("n", "<C-Right>", "<C-w>l", { desc = "Window Right", remap = true })

map("n", "<M-Up>", "<cmd>resize +2<cr>", { desc = "Increase Height" })
map("n", "<M-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Height" })
map("n", "<M-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Width" })
map("n", "<M-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Height" })

map("n", "<C-W>", "<cmd>tabclose<cr>", { desc = "Close Tab" })
