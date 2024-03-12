return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",            -- Optional image support in preview window: See `# Preview Mode` nifor more information
	},
	event = "VeryLazy",
	config = function()
		require("neo-tree").setup({
			window = {
				mappings = {
					["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
				},
			},
		})
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>")
		vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
	end,
}
