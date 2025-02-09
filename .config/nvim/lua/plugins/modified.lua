local vscode_colorscheme = {
  "Mofiqul/vscode.nvim",
  opts = {
    transparent = true,
    group_overrides = {
      NormalFloat = { bg = "none" },
    },
  },
}

return {
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "vscode" },
    dependencies = { vscode_colorscheme },
  },

  {
    "williamboman/mason.nvim",
    opts = { ui = { border = "rounded" } },
  },
  {
    "folke/snacks.nvim",
    opts = { indent = { enabled = false } },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = { auto_install = true },
  },

  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
        },
        documentation = { window = { border = "rounded" } },
      },
    },
  },
}
