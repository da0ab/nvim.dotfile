return {
	-- Сама тема Nord
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nord_contrast = true
			vim.cmd("colorscheme nord")
			vim.api.nvim_set_hl(0, "Normal", { bg = "#1e1e2e" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e" })
		end,
	},

	-- Статус-строка (lualine) в стиле Nord
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				theme = "nord",
			},
		},
	},
}
