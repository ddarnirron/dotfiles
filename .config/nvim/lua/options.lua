-- Sets SPACE as the leader key.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- We have a nerd font installed.
vim.g.have_nerd_font = true

-- Display relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Hide current mode.
vim.opt.showmode = false

-- Line will be visually indented.
vim.opt.breakindent = true

-- Creates a file for undo actions.
vim.opt.undofile = true

-- Sets a low update time.
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time.
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened.
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Enables code previews in a window as we type.
vim.opt.inccommand = "split"

-- Show which line the cursor is on.
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 15

-- Sync clipboard between OS and Neovim.
-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Set proper TAB size.
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2
