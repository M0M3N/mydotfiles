local keymap = vim.keymap

-- general
keymap.set("n", "<Esc>", ":nohl<CR>")
keymap.set("i", "<C-h>", "<left>")
keymap.set("i", "<C-j>", "<down>")
keymap.set("i", "<C-k>", "<up>")
keymap.set("i", "<C-l>", "<right>")

-- fixing some annoying keymaps
keymap.set("n", "J", "<nop>")
keymap.set("n", "<C-j>", "<nop>")
keymap.set("i", "<C-d>", "<nop>")
keymap.set("i", "<C-u>", "<nop>")

-- windows and tab management
keymap.set("n", "<Leader>v", "<C-w>s", { noremap = true })
keymap.set("n", "<Leader>h", "<C-w>v", { noremap = true })
keymap.set("n", "<C-n>", "<cmd>tabnew<CR>")
keymap.set("n", "<A-]>", "<cmd>tabn<CR>")
keymap.set("n", "<A-[>", "<cmd>tabp<CR>")

vim.api.nvim_set_keymap("n", "<C-q>", "", {
  noremap = true,
  silent = true,
  callback = function()
    local s = pcall(function() vim.cmd("close") end)
    if not s then
      s = pcall(function() vim.cmd("tabclose") end)
      if not s then
        print("cannot close the last tab!")
      end
    end
  end,
})

-- text editing
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("x", "<Leader>p", "\"_dP")
keymap.set({ "n", "v" }, "<Leader>d", "\"_d")
keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- terminal
keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- others
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
