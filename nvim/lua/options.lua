-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a" -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
-- vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = false

-- Searching
vim.opt.incsearch = true -- search as characters are entered
-- vim.opt.hlsearch = false            -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- bufferline
vim.opt.termguicolors = true
require("bufferline").setup({})

-- telescope
vim.keymap.set("n", "gs", function()
	require("telescope.builtin").lsp_definitions()
end, { noremap = true, silent = true })

-- diagnostics
vim.diagnostic.config({
	virtual_text = {
		current_line = true,
		severity = {
			min = "HINT",
			max = "WARN",
		},
	},
	virtual_lines = {
		current_line = true,
		severity = {
			min = "ERROR",
		},
	},
})

-- python
local user = os.getenv("USERNAME")
vim.g.python_3_host_prog = "/home/" .. user .. "/miniconda3/envs/main_env/bin/python3"

-- autosession
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- markdown preview
vim.g.nvim_markdown_preview_format = "markdown"
