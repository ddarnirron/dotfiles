return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    {
      "nvim-telescope/telescope-ui-select.nvim",
    },
  },
  config = function()
    local builtin = require("telescope.builtin")

    local map_keymap = function(modes, keys, func, desc)
      vim.keymap.set(modes, keys, func, { desc = "SEARCH: " .. desc })
    end

    map_keymap("n", "<LEADER>sh", builtin.help_tags, "Search in help.")
    map_keymap("n", "<LEADER>sk", builtin.keymaps, "Search keymaps.")
    map_keymap("n", "<LEADER>sf", builtin.find_files, "Search files.")
    map_keymap("n", "<LEADER>ss", builtin.builtin, "Search in Telescope.")
    map_keymap("n", "<LEADER>sw", builtin.grep_string, "Search current work.")
    map_keymap("n", "<LEADER>sg", builtin.live_grep, "Search using grep.")
    map_keymap("n", "<LEADER>sd", builtin.diagnostics, "Search diagnostics.")
    map_keymap("n", "<LEADER>sr", builtin.resume, "Search resume.")
    map_keymap("n", "<LEADER>s.", builtin.oldfiles, "Search recent files.")
    map_keymap("n", "<LEADER>se", builtin.buffers, "Search existing buffers.")
    map_keymap(
      "n",
      "<LEADER>sc",
      function()
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
          winblend = 10,
          previewer = false,
        }))
      end,
      "Search in current buffer."
    )
    map_keymap(
      "n",
      "<LEADER>so",
      function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        })
      end,
      "Search in open files."
    )
    map_keymap(
      "n",
      "<LEADER>sneo",
      function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end,
      "Search in Neovim config files."
    )
  end,
}
