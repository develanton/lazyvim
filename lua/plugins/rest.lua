return {
  {
    "rest-nvim/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup({
        -- Optional: Customize the plugin's behavior
        result_split_horizontal = false, -- Use a vertical split for results
        skip_ssl_verification = true, -- Allow skipping SSL verification for self-signed certs
        highlight = {
          enabled = true, -- Enable result highlighting
          timeout = 150, -- Timeout for result highlighting
        },
        jump_to_request = false, -- Jump to the request in the response view
      })

      -- Keybindings for rest.nvim
      vim.api.nvim_set_keymap(
        "n",
        "<leader>rr",
        "<cmd>lua require('rest-nvim').run()<CR>",
        { noremap = true, silent = true, desc = "Run HTTP request" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>rp",
        "<cmd>lua require('rest-nvim').run(true)<CR>",
        { noremap = true, silent = true, desc = "Preview HTTP request" }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>rl",
        "<cmd>lua require('rest-nvim').last()<CR>",
        { noremap = true, silent = true, desc = "Re-run last HTTP request" }
      )
    end,
  },
}
