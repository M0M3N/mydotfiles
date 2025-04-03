---@diagnostic disable: undefined-global

return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        -- vim.cmd("colorscheme retrobox")
        vim.cmd("colorscheme tokyonight")
    end
}
