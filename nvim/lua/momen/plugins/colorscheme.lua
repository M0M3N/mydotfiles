return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
		})
		vim.cmd("colorscheme catppuccin")
	end,
	-- "Rigellute/rigel",
	-- priority = 1000,
	-- config = function()
	-- 	vim.cmd("colorscheme rigel")
	-- end,
}
