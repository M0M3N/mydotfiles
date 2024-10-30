return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			gs.toggle_current_line_blame() -- toggle git blame by default
			-- Navigation
			-- vim.keymap.set("n", "]h", gs.next_hunk, { buffer = bufnr, desc = "Next Hunk" })
			-- vim.keymap.set("n", "[h", gs.prev_hunk, { buffer = bufnr, desc = "Prev Hunk" })

			-- Actions
			-- vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
			-- vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
			-- vim.keymap.set("v", "<leader>hs", function()
			-- 	gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) -- vim.fn.line(".") gets the line i which visual mode is actiove. and "v" refers to the selected lines if many.
			-- end, { buffer = bufnr, desc = "Stage hunk" })
			-- vim.keymap.set("v", "<leader>hr", function()
			-- 	gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			-- end, { buffer = bufnr, desc = "Reset hunk" })

			vim.keymap.set("n", "<leader>gs", gs.stage_buffer, { buffer = bufnr, desc = "Stage buffer" })
			vim.keymap.set("n", "<leader>gr", gs.reset_buffer, { buffer = bufnr, desc = "Reset buffer" })

			-- vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { buffer = bufnr, desc = "Undo stage hunk" })

			-- vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })

			-- vim.keymap.set("n", "<leader>hb", function()
			-- 	gs.blame_line({ full = true })
			-- end, { buffer = bufnr, desc = "Blame line" })
			vim.keymap.set(
				"n",
				"<leader>gb",
				gs.toggle_current_line_blame,
				{ buffer = bufnr, desc = "Toggle line blame" }
			)

			vim.keymap.set("n", "<leader>gd", gs.diffthis, { buffer = bufnr, desc = "Diff this" })
			-- vim.keymap.set("n", "<leader>hD", function()
			-- 	gs.diffthis("~")
			-- end, { buffer = bufnr, desc = "Diff this ~" })

			-- Text object
			-- vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Gitsigns select hunk" })
		end,
	},
}
