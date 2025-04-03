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
            cmd = { 'clangd', '--background-index', '--clang-tidy', '--log=verbose', '--completion-style=detailed' },
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
            capabilities = capabilities,
        }
        require 'lspconfig'.pyright.setup { capabilities = capabilities }
        require 'lspconfig'.ts_ls.setup { capabilities = capabilities }
        require 'lspconfig'.taplo.setup {} -- TOML

        -- Format on save for (AFAIK) all language servers.
        -- To use LSP features beyond those provided by Nvim (see lsp-buf), you can set
        -- keymaps and options on Client:on_attach() or LspAttach.
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if not client then return end

                ---@diagnostic disable-next-line: param-type-mismatch, missing-parameter
                if client.supports_method('textDocument/formatting') then
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                        end
                    })
                end
            end
        })
        vim.keymap.set('n', "<Leader>ca", vim.lsp.buf.code_action, {})
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, {})
    end
}
