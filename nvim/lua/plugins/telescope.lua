---@diagnostic disable: undefined-global

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local telescope = require("telescope")
        -- local tactions = require("telescope.actions")
        local tbuiltin = require("telescope.builtin")

        telescope.setup({
            pickers = {
                find_files = { theme = "ivy" },
                live_grep = { theme = "ivy" },
                man_pages = { theme = "ivy" },
                command_history = { theme = "ivy" },
                current_buffer_fuzzy_find = { theme = "ivy" },
            },
            extensions = { fzf = {} },
        })

        vim.keymap.set("n", "<Leader>ff", tbuiltin.find_files)
        vim.keymap.set("n", "<Leader>fs", tbuiltin.live_grep)
        vim.keymap.set("n", "<Leader>fz", tbuiltin.current_buffer_fuzzy_find)
        vim.keymap.set("n", "q:", tbuiltin.command_history, { noremap = true })
        vim.keymap.set("n", "man", function() tbuiltin.man_pages({ sections = { "ALL" } }) end)
    end
}
