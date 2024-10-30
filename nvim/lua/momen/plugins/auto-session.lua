return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop" },
    })

    local keymap = vim.keymap

    keymap.set("n", "<Leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore Session For CWD" })
    keymap.set("n", "<Leader>ws", "<cmd>SessionSave<CR>", { desc = "Save Session For CWD" })
  end,
}
