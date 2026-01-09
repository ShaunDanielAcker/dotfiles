require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		javascript = { "prettier" },
		typescript = { "prettier" },
		json = { "fixjson" },
		c = { "clangd " },
		cpp = { "clang-format" },
	},
	formatters = {
		prettier = {
			prepend_args = function()
				return { "--tab-width", "4" }
			end,
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

require("Comment").setup()
