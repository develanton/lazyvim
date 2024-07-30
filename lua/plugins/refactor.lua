return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "javascript", "typescript", "tsx" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        refactor = {
          highlight_definitions = { enable = true },
          highlight_current_scope = { enable = true },
        },
      })
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup({})

      -- Keybindings for refactor
      vim.api.nvim_set_keymap(
        "v",
        "<leader>re",
        "<Esc><cmd>lua require('refactoring').refactor('Extract Function')<CR>",
        { noremap = true, silent = true, expr = false }
      )

      vim.api.nvim_set_keymap(
        "v",
        "<leader>rf",
        "<Esc><cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
        { noremap = true, silent = true, expr = false }
      )

      vim.api.nvim_set_keymap(
        "v",
        "<leader>rv",
        "<Esc><cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
        { noremap = true, silent = true, expr = false }
      )

      vim.api.nvim_set_keymap(
        "v",
        "<leader>ri",
        "<Esc><cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
        { noremap = true, silent = true, expr = false }
      )
    end,
  },
}
