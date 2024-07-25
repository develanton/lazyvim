-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<Up>", "<cmd>resize +2<cr>", { desc = "Increase window height", remap = true })
map("n", "<Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height", remap = true })
map("n", "<Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width", remap = true })
map("n", "<Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width", remap = true })
vim.api.nvim_set_keymap("n", "<leader>cg", ":ChatGPT<CR>", { noremap = true, silent = true })
-- Keybinding to insert JS log statement
vim.api.nvim_set_keymap("n", "<C-M-l>", "<cmd>lua _G.insert_js_log_statement()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>ce", ":'<,'>ChatGPTEditWithInstructions<CR>", { noremap = true, silent = true })

-- lazygit
vim.api.nvim_set_keymap("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })
