return {
  "nvim-lua/plenary.nvim",
  config = function()
    -- Function to insert JavaScript log statement
    _G.insert_js_log_statement = function()
      -- Get the word under the cursor
      local word_under_cursor = vim.fn.expand("<cword>")

      -- Create the log statement with the word as the second argument
      local log_statement = string.format('console.log("LOG:", %s);', word_under_cursor)

      -- Get the current line and cursor position
      local current_line = vim.api.nvim_get_current_line()
      local cursor_pos = vim.api.nvim_win_get_cursor(0)

      -- Insert log statement one line below the current line
      vim.api.nvim_buf_set_lines(0, cursor_pos[1], cursor_pos[1], false, { log_statement })

      -- Move the cursor to the log statement line and place it after the log statement
      vim.api.nvim_win_set_cursor(0, { cursor_pos[1] + 1, #log_statement })
    end
  end,
}
