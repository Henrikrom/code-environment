return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  config = function()
    require("nvim-tree").setup({
      -- Nvim-Tree options
      view = {
        width = 50, -- Width of the Nvim-Tree window
        side = "left", -- Side of the screen to display Nvim-Tree
        relativenumber = true, -- Use relative line numbers in Nvim-Tree
      },

      actions = {
          open_file = {
              quit_on_open = true, -- Closes nvim-tree when opening a file
          },
      },

      --renderer = {
      --  highlight_git = true, -- Highlight git changes in the tree
      --  icons = {
      --    show = {
      --      git = true,
      --      folder = true,
      --      file = true,
      --    },
      --  },
      --},
      --git = {
      --  enable = true, -- Enable git integration
      --},
      --diagnostics = {
      --  enable = true, -- Show diagnostics in the tree
      --  icons = {
      --    hint = "",
      --    info = "",
      --    warning = "",
      --    error = "",
      --  },
      --},
    })
  end,
}

