-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		"chrishrb/gx.nvim",
		keys = {
			{ "gx", "<cmd>Browse<cr>", mode = { "n", "x" } },
		},
		cmd = { "Browse" },
		init = function()
			vim.g.netrw_nogx = 1
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = true, -- default settings
	},
}
