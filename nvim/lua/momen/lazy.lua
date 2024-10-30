-- this will bootstrap lazy, so when Neovim starts it will be installed on the machine if not already.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    "lazypath",
  })
end

vim.opt.rtp:prepend(lazypath)

-- here to pass a path to a folder that holds up all our plugin configs.
require("lazy").setup({{ import = "momen.plugins" }, { import = "momen.plugins.lsp" }}, {
  checker = {
    enable = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  }
})
