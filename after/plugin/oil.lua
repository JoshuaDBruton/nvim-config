require("oil").setup({
	is_hidden_file = function(name, bufnr)
		return name ~= ".." and vim.startswith(name, ".")
	end,
	default_file_explorer=true,
	view_options = {
		show_hidden = true,
		is_always_hidden = function(name, _)
			return name == "node_modules" or name == ".git"
		end,
	},
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Parent Directory with Oil.nvim"})
