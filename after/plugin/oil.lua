--
require("oil").setup({
	columns = {
		"icon",
		"permissions",
		"size",
		"mtime",
	},
	constrain_cursor = "name",

	keymaps = {
		["g?"] = "actions.show_help",
		["ee"] = "echo hello",
		["<CR>"] = "actions.select",
		["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
		["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
		["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
		-- ["<C-p>"] = "actions.preview",
		["q"] = "actions.close",
		["<C-l>"] = "actions.refresh",
		["H"] = "actions.parent",
		["-"] = "actions.open_cwd",
		["`"] = "actions.cd",
		["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
		["gs"] = "actions.change_sort",
		["gx"] = "actions.open_external",
		["g."] = "actions.toggle_hidden",
		["g\\"] = "actions.toggle_trash",
	},
	use_default_keymaps = false,
	view_options = {
		-- Show files and directories that start with "."
		show_hidden = false,
		-- This function defines what is considered a "hidden" file
		is_hidden_file = function(name, bufnr)
			return vim.startswith(name, ".")
		end,
		-- This function defines what will never be shown, even when `show_hidden` is set
		is_always_hidden = function(name, bufnr)
			return false
		end,
		-- Sort file names in a more intuitive order for humans. Is less performant,
		-- so you may want to set to false if you work with large directories.
		natural_order = false,
		-- Sort file and directory names case insensitive
		case_insensitive = false,
		sort = {
			-- sort order can be "asc" or "desc"
			-- see :help oil-columns to see which columns are sortable
			{ "type", "asc" },
			{ "name", "asc" },
		},
	},
})

vim.keymap.set("n", "<leader>ee", "<cmd>Oil <CR>")
-- vim.keymap.set("n", "<leader>ee", vim.cmd.NvimTreeToggle)
-- vim.keymap.set("n", "<leader>er", vim.cmd.NvimTreeFindFile)
