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
    local tactions = require("telescope.actions")
    local tstate = require("telescope.actions.state")
    local tbuiltin = require("telescope.builtin")

    -- Check if the file opened in another tab before switching the current buffer.
    local function switch_if_exist(prompt_bufnr)
      local selection = tstate.get_selected_entry()
      tactions.close(prompt_bufnr)

      -- Get selection's file path.
      local filepath = selection.filename or selection.value
      local bufnr = vim.fn.bufnr(filepath, false)

      if bufnr > 0 then
        for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
          for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
            if vim.api.nvim_win_get_buf(win) == bufnr then
              vim.api.nvim_set_current_tabpage(tab)
              vim.api.nvim_set_current_win(win)
              return
            end
          end
        end
      end

      vim.cmd('e ' .. vim.fn.fnameescape(filepath))
    end

    telescope.setup({
      defaults = {
        mappings = {
          i = { ["<CR>"] = switch_if_exist },
          n = { ["<CR>"] = switch_if_exist },
        },
      },
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
