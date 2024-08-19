-- Highlight when yanking (copying) text.
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("custom-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesWindowOpen",
  callback = function(args)
    local win_id = args.data.win_id

    -- Customize window-local settings
    local config = vim.api.nvim_win_get_config(win_id)
    config.border, config.title_pos = "double", "right"
    vim.api.nvim_win_set_config(win_id, config)
  end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  desc = "Closes various views on exit",
  group = vim.api.nvim_create_augroup("custom-close-views", { clear = true }),
  callback = function()
    vim.cmd("DiffviewClose")
    vim.cmd("Trouble lsp close focus=false win.position=right")
  end,
})
