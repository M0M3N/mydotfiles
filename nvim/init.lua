vim.g.mapleader = " "

require("config.lazy")
require("config.options")
require("config.keymaps")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "highlight after yanking",
  callback = function()
    vim.highlight.on_yank()
  end
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    if client.supports_method('textDocument/formatting') then
      -- format current buffer on save
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
        end
      })
    end
  end
})
