return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local telescope = require("telescope")
        local tactions = require("telescope.actions")
        local tbuiltin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = tactions.move_selection_next,
                        ["<C-k>"] = tactions.move_selection_previous,
                    }
                }
            },
            extensions = { fzf = {} }
        })
        vim.keymap.set("n", "<Leader>ff", function()
            local opts = require('telescope.themes').get_ivy({})
            tbuiltin.find_files(opts)
        end)
        vim.keymap.set("n", "<Leader>fs", tbuiltin.live_grep)
        vim.keymap.set("n", "<Leader>fh", tbuiltin.help_tags)
    end
}
