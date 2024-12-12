return {
    -- Your other plugin configurations...

    {
        "tomlion/vim-solidity", -- A plugin for Solidity syntax highlighting
        ft = { "solidity" },    -- Load this plugin only for Solidity files
    },

    {
        "neovim/nvim-lspconfig",               -- Provides LSP configuration
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- Enhanced syntax highlighting
        },
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.solc.setup({
                cmd = { "solc", "--lsp" }, -- Command to start Solidity LSP server
                filetypes = { "solidity" },
                root_dir = lspconfig.util.root_pattern("hardhat.config.*", "truffle-config.*", ".git"),
            })
        end,
        ft = { "solidity" }, -- Lazy-load when a Solidity file is opened
    },

    -- Treesitter configuration for Solidity
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "solidity" }, -- Ensure Solidity parser is installed
                highlight = {
                    enable = true,                 -- Enable Treesitter-based highlighting
                },
            })
        end,
    },

    -- Additional plugins for development
    {
        "simrat39/rust-tools.nvim", -- Optional: Add debugging or other advanced features
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            -- Example for debugging Solidity
            require("dap").adapters.solidity = {
                type = "server",
                host = "127.0.0.1",
                port = 9229,
            }
        end,
        ft = { "solidity" },
    },

    -- Other plugins...
}
