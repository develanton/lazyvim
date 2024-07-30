return {
  -- other plugins
  "kyazdani42/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      override = {
        -- Define any specific icons you want to override
      },
      default = true,
    })
  end,
}
