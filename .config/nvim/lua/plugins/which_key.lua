return {              -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require("which-key").setup()

    -- Document existing key chains
    require("which-key").add({
      { "<LEADER>b", group = "[B]UFFER" },
      { "<LEADER>g", group = "[G]IT" },
      { "<leader>c", group = "[C]ODE" },
      { "<leader>s", group = "[S]EARCH" },
    })
  end,
}
