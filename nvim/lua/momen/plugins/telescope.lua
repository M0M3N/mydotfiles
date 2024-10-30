return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",

  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          -- insert mode
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- up
            ["<C-j>"] = actions.move_selection_next, -- down
          }
        }
      }
    })

    telescope.load_extension("fzf")

    local keymap = vim.keymap

    keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<Leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Fuzzy find string in cwd" })
    keymap.set("n", "<Leader>fw", "<cmd>Telescope grep_string<CR>", { desc = "Fuzzy find word under cursor" })
    keymap.set("n", "<Leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find Todos" })

  end,
}
