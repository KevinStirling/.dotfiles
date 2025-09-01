return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require 'nvim-treesitter.configs'.setup {
				ensure_installed = {
					"c", "go", "gdscript", "godot_resource", "gdshader",
					"lua", "vim", "vimdoc", "query", "markdown",
					"markdown_inline", "tsx", "svelte", "html", "typescript"
				},
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			}
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = { mode = "cursor", max_lines = 3 },
	}
}
