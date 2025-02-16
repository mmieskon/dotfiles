-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.undofile = false
vim.opt.cursorline = false
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.g.snacks_animate = false

vim.diagnostic.config({
  float = {
    header = "",
    border = "rounded",
  },
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
