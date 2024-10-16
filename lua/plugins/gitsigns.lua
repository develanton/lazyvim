return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      -- Enable inline blame
      current_line_blame = true,
      -- Optional settings for better control
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' means 'end of line'
        delay = 1000,
        ignore_whitespace = false,
      },
      -- Optional key mappings
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Example key mappings
        map("n", "<leader>gb", gs.blame_line)
      end,
    })
  end,
}
