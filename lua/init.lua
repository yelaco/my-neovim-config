-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- setup colorscheme
-- local dracolors = require("dracula").colors()
-- require("dracula").setup({
--   colors = dracolors,
--   transparent_bg = true,
--   italic_comment = true,
--   show_end_of_buffer = false,
--   overrides = {},
-- })

vim.cmd.colorscheme("dracula")
vim.cmd([[highlight CursorLine guibg=#3A414C]])

-- setup flutter development environment
require("flutter-tools").setup {}

-- setup go development environment
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

-- project_nvim
require("project_nvim").setup {}

-- Custom keymaps
vim.keymap.set("n", "<Leader>mp", "<cmd>MarkdownPreview<CR>", { desc = "Markdown Preview" })
