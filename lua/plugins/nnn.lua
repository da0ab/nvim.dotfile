return {
	"mcchrish/nnn.vim",
	config = function()
		require("nnn").setup({
			action = {
				["<c-t>"] = "tabnew",
				["<c-s>"] = "split",
				["<c-v>"] = "vsplit",
			},
		})

		vim.keymap.set("n", "<leader>e", "<cmd>NnnPicker<cr>", { silent = true, desc = "Открыть nnn" })
	end,
}
