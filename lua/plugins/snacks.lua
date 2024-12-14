return {
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      -- your dashboard configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      ---@class snacks.dashboard.Config
      ---@field enabled? boolean
      ---@field sections snacks.dashboard.Section
      ---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>
      width = 60,
      row = nil, -- dashboard position. nil for center
      col = nil, -- dashboard position. nil for center
      pane_gap = 4, -- empty columns between vertical panes
      autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
      -- These settings are used by some built-in sections
      preset = {
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        -- Used by the `keys` section to show keymaps.
        -- Set your custom keymaps here.
        -- When using a function, the `items` argument are the default keymaps.
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        -- Used by the `header` section
        header = [[
██╗  ██╗ █████╗ ██████╗ ██████╗ ██╗   ██╗             
██║  ██║██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝             
███████║███████║██████╔╝██████╔╝ ╚████╔╝              
██╔══██║██╔══██║██╔═══╝ ██╔═══╝   ╚██╔╝               
██║  ██║██║  ██║██║     ██║        ██║                
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝        ╚═╝                
]]
},
      -- item field formatters
      formats = {
        icon = function(item)
          if item.file then
            local is_directory = vim.fn.isdirectory(item.file) == 1
            if is_directory then
              -- Use a custom icon for directories
              return { "", width = 2, hl = "Directory" } -- Custom closed directory icon
            else
              -- Get the file icon based on the extension or file name
              local icon, hl = require("nvim-web-devicons").get_icon(item.file, nil, { default = true })
              return { icon, width = 2, hl = hl }
            end
          end
          return { item.icon, width = 2, hl = "icon" } -- Fallback for non-file items
        end,
        footer = { "%s", align = "center" },
        header = { "%s", align = "center" },
        file = function(item, ctx)
          local fname = vim.fn.fnamemodify(item.file, ":~")
          fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
          if #fname > ctx.width then
            local dir = vim.fn.fnamemodify(fname, ":h")
            local file = vim.fn.fnamemodify(fname, ":t")
            if dir and file then
              file = file:sub(-(ctx.width - #dir - 2))
              fname = dir .. "/…" .. file
            end
          end
          local dir, file = fname:match("^(.*)/(.+)$")
          return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
        end,
      },
  
      sections = {
        { section = "header"},
             {
          pane = 2, -- Pane 2 for "Hacking"
          title = [[
██╗  ██╗ █████╗  ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗ 
██║  ██║██╔══██╗██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝ 
███████║███████║██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗
██╔══██║██╔══██║██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║
██║  ██║██║  ██║╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝
╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝ 
]],
        },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          -- key = "g", -- Hotkey to show Git status
          enabled = function()
            return vim.fn.systemlist("git rev-parse --is-inside-work-tree")[1] == "true"
          end,
          cmd = "git status --short --branch",
          width = 60,
          height = 10,
          padding = 1,
        },
        { section = "startup" },
      },
    },
  },
}
