-- hit `:h lspconfig-all`
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
        "saghen/blink.cmp"
    },
    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        require("lspconfig").lua_ls.setup { capabilities = capabilities }
        require("lspconfig").clangd.setup {
            cmd = { 'clangd', '--background-index', '--clang-tidy', '--log=verbose' },
            filetypes = { "c", "cpp", "objc", "objcpp" },
            capabilities = capabilities
        }
        require 'lspconfig'.pyright.setup { capabilities = capabilities }
        require 'lspconfig'.ts_ls.setup { capabilities = capabilities }
    end
}
