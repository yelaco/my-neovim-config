-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- setup colorscheme
local dracolors = require("dracula").colors()
require("dracula").setup({
  colors = dracolors,
  transparent_bg = true,
  italic_comment = true,
  show_end_of_buffer = false,
  overrides = {},
})

vim.cmd.colorscheme("dracula")

require("go").setup()
require("go.format").goimports()

-- Run gofmt + goimports on save
local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("go.format").goimports()
  end,
  group = format_sync_grp,
})
