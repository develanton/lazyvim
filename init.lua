vim.o.mouse = "a"
-- vim.o.ttymouse = "xterm2"
vim.o.termguicolors = true
vim.o.guicursor = "n-v-c:block-Cursor/lCursor"

-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")
