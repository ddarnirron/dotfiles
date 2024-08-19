-- Clear highlights on search when pressing <Esc> in normal mode.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- TIP: Disables arrow keys in normal mode.
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move."<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move."<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move."<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move."<CR>')

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window." })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window." })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window." })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window." })

-- Move across buffer tabs.
vim.keymap.set("n", "L", "<cmd>bnext<CR>", { desc = "MOVE: Go to the left buffer." })
vim.keymap.set("n", "H", "<cmd>bprevious<CR>", { desc = "MOVE: Go to the right buffer." })

-- Git related.
vim.keymap.set("n", "<LEADER>gdo", "<cmd>DiffviewOpen<CR>", { desc = "GIT: Open diff view." })
vim.keymap.set("n", "<LEADER>gdc", "<cmd>DiffviewClose<CR>", { desc = "GIT: Close diff view." })

-- Keymaps to close opened buffers more easily.
vim.keymap.set("n", "<LEADER>bcc", "<CMD>bd<CR>", { desc = "BUFFER: Close current buffer." })
vim.keymap.set("n", "<LEADER>bca", "<CMD>%bd<CR>", { desc = "BUFFER: Close all buffers." })

-- File explorer.
vim.keymap.set(
  "n",
  "<LEADER>f",
  function()
    require("mini.files").open(vim.loop.cwd(), true)
  end,
  { desc = "FILES: Open file explorer." }
)

-- Code.
vim.keymap.set("n", "<LEADER>cxx", "<CMD>Trouble diagnostics toggle<CR>", { desc = "CODE: Open diagnostics." })
vim.keymap.set("n", "<LEADER>cxX", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>",
  { desc = "CODE: Open diagnostics for current buffer." })
vim.keymap.set("n", "<LEADER>cs", "<CMD>Trouble symbols toggle focus=false<CR>", { desc = "CODE: Open symbols." })
vim.keymap.set("n", "<LEADER>clsp", "<CMD>Trouble lsp toggle focus=false win.position=right<CR>",
  { desc = "CODE: Open LSP view." })

vim.keymap.set("n", "<LEADER>cll", "<CMD>Trouble loclist toggle<CR>",
  { desc = "CODE: Open Location List view." })

vim.keymap.set("n", "<LEADER>cqf", "<CMD>Trouble qflist toggle<CR>",
  { desc = "CODE: Open Quickfix List view." })
