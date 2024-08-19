return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v4.x",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",

    -- Custom LSP servers.
    { "towolf/vim-helm", ft = "helm" },
  },
  config = function()
    local lsp_zero = require("lsp-zero")

    -- lsp_attach is where you enable features that only work
    -- if there is a language server active in the file
    local lsp_attach = function(_, bufnr)
      local map_keymap = function(modes, keys, func, desc)
        vim.keymap.set(modes, keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
      end

      map_keymap("n", "<LEADER>bh", "<CMD>lua vim.lsp.buf.hover()<CR>", "Hover selected item.")
      map_keymap("n", "<LEADER>bgd", "<CMD>lua vim.lsp.buf.definition()<CR>", "Go to selected item definition.")
      map_keymap("n", "<LEADER>bgD", "<CMD>lua vim.lsp.buf.declaration()<CR>", "Go to selected item declaration.")
      map_keymap("n", "<LEADER>bgi", "<CMD>lua vim.lsp.buf.implementation()<CR>", "Go to selected item implementation.")
      map_keymap("n", "<LEADER>bgtd", "<CMD>lua vim.lsp.buf.type_definition()<CR>",
        "Go to selected item type definition.")
      map_keymap("n", "<LEADER>bgr", "<CMD>lua vim.lsp.buf.references()<CR>", "Go to selected item references.")
      map_keymap("n", "<LEADER>bgsh", "<CMD>lua vim.lsp.buf.signature_help()<CR>", "Go to selected item signature help.")
      map_keymap("n", "<LEADER>br", "<CMD>lua vim.lsp.buf.rename()<CR>", "Rename selected item.")
      map_keymap("n", "<LEADER>bf", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, "Format current buffer.")
      map_keymap("n", "<LEADER>ba", "<CMD>lua vim.lsp.buf.code_action()<CR>", "Open buffer code actions.")
    end

    lsp_zero.extend_lspconfig({
      sign_text = true,
      lsp_attach = lsp_attach,
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })

    lsp_zero.use('solidity', {
      cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
      filetypes = { 'solidity' },
      root_dir = require("lspconfig.util").root_pattern("hardhat.config.js", "hardhat.config.ts", "foundry.toml",
        "remappings.txt", "truffle.js", "truffle-config.js", "ape-config.yaml", ".git", "package.json"),
      single_file_support = true,
    })

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "gopls", "rust_analyzer" },

      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
      },

      helm_ls = function()
        require("lspconfig").helm_ls.setup({
          settings = {
            ["helm-ls"] = {
              yamlls = {
                path = "yaml-language-server",
              },
            },
          },
        })
      end,
    })
  end,
}
