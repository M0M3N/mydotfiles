vim.g.mapleader = " "

-- load keymaps of vim from lua
local keymap = vim.keymap

keymap.set("n", "<Leader>nh", ":nohl<CR>", { desc = "clear search highlights" })
keymap.set("n", "<Esc>", ":nohl<CR>")

-- window management
keymap.set("n", "<Leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<Leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<C-q>", "<cmd>close<CR>", { desc = "Close current window" })

-- tab management
keymap.set("n", "<C-n>", "<cmd>tabnew<CR>", { desc = "Open a new tab" })
-- try to close selected window, if there is no window, close current tab
vim.api.nvim_set_keymap("n", "<C-q>", "", {
	noremap = true,
	silent = true,
	callback = function()
		local success = pcall(function()
			vim.cmd("close")
		end)
		if not success then
			vim.cmd("tabclose")
		end
	end,
})
keymap.set("n", "<C-]>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<C-[>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
