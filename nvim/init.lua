vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

local opt = vim.opt
local fn = vim.fn
local api = vim.api

local state = fn.stdpath("state")
local data = fn.stdpath("data")
local directories = {
	state .. "/undo",
	state .. "/backup",
	state .. "/swap",
	state .. "/view",
	data .. "/sessions",
}

for _, directory in ipairs(directories) do
	fn.mkdir(directory, "p")
end

opt.termguicolors = true
opt.background = "dark"
opt.mouse = ""
opt.hidden = true
opt.autoread = true
opt.autowrite = true
opt.confirm = true
opt.updatetime = 200
opt.timeoutlen = 400
opt.ttimeoutlen = 10
opt.history = 1000
opt.undofile = true
opt.undodir = state .. "/undo"
opt.backupdir = state .. "/backup"
opt.directory = state .. "/swap//"
opt.viewdir = state .. "/view"
opt.sessionoptions = { "buffers", "curdir", "folds", "help", "tabpages", "winsize", "terminal", "localoptions" }

opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.signcolumn = "yes"
opt.laststatus = 3
opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1
opt.wrap = true
opt.linebreak = true
opt.textwidth = 80
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.splitbelow = true
opt.splitright = true
opt.winminwidth = 5
opt.pumheight = 10
opt.completeopt = { "menu", "menuone", "noselect" }
opt.wildmode = { "longest:full", "full" }

opt.expandtab = true
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true
opt.inccommand = "split"

opt.list = true
opt.listchars = {
	tab = "> ",
	trail = ".",
	extends = ">",
	precedes = "<",
	nbsp = "+",
}
opt.fillchars = {
	eob = " ",
	fold = " ",
	foldopen = "v",
	foldclose = ">",
	diff = "-",
}
opt.showbreak = ">> "
opt.breakindent = true

opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

opt.guicursor = {
	"n-v-c:block",
	"i-ci-ve:ver25",
	"r-cr-o:hor20",
}

vim.g.loaded_matchparen = 1

local map = vim.keymap.set

map("n", "<leader>x", function()
	vim.cmd.tabedit(fn.stdpath("config") .. "/init.lua")
end, { desc = "Open config" })

map("n", "<leader>n", function()
	opt.relativenumber = not opt.relativenumber:get()
end, { desc = "Toggle relative number" })

map("n", "j", "gj")
map("n", "k", "gk")
map("x", "j", "gj")
map("x", "k", "gk")

map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

map("n", "g;", "g;zz")
map("n", "g,", "g,zz")
map("x", "<", "<gv")
map("x", ">", ">gv")
map("n", "J", "mzJ`z")
map("n", "<leader>q", [[:%s/\s\+$//e<CR>:nohlsearch<CR>]], { desc = "Trim trailing spaces" })
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Undo tree" })

map("n", "<Space>", function()
	if fn.foldlevel(".") > 0 then
		vim.cmd.normal({ "za", bang = true })
	else
		api.nvim_feedkeys(" ", "n", false)
	end
end, { desc = "Toggle fold" })

local augroup = api.nvim_create_augroup("ivim_core", { clear = true })

api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 180 })
	end,
})

api.nvim_create_autocmd("BufWinLeave", {
	group = augroup,
	pattern = "*.*",
	callback = function(args)
		if vim.bo[args.buf].buftype == "" then
			pcall(vim.cmd, "silent! mkview!")
		end
	end,
})

api.nvim_create_autocmd("BufWinEnter", {
	group = augroup,
	pattern = "*.*",
	callback = function(args)
		if vim.bo[args.buf].buftype == "" then
			pcall(vim.cmd, "silent! loadview")
		end
	end,
})

api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
	group = augroup,
	callback = function()
		vim.opt_local.cursorline = false
	end,
})

api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
	group = augroup,
	callback = function()
		vim.opt_local.cursorline = true
	end,
})

api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	callback = function(args)
		local mark = api.nvim_buf_get_mark(args.buf, '"')
		local line_count = api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			pcall(api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local result = fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})

	if vim.v.shell_error ~= 0 then
		error("Failed to clone lazy.nvim:\n" .. result)
	end
end

opt.rtp:prepend(lazypath)

local plugins = {
	{
		"gbprod/nord.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("nord")
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				theme = "nord",
				globalstatus = true,
				component_separators = "",
				section_separators = "",
				disabled_filetypes = { "neo-tree", "dashboard" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				diagnostics = "nvim_lsp",
				always_show_bufferline = true,
				separator_style = "slant",
				offsets = {
					{
						filetype = "neo-tree",
						text = "Files",
						highlight = "Directory",
						separator = true,
					},
				},
			},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			indent = { char = "|" },
			scope = { enabled = false },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "^" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			check_ts = true,
		},
	},
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
	},
	{
		"mg979/vim-visual-multi",
		branch = "master",
		keys = {
			{ "<C-n>", mode = { "n", "x" } },
		},
	},
	{
		"echasnovski/mini.align",
		version = false,
		keys = {
			{ "ga", mode = { "n", "x" }, desc = "Align text" },
		},
		config = function()
			require("mini.align").setup()
		end,
	},
	{
		"tpope/vim-repeat",
		event = "VeryLazy",
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern",
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash jump",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash treesitter",
			},
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		keys = {
			{ "<leader>f", "<cmd>Neotree toggle reveal_force_cwd filesystem left<CR>", desc = "File tree" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			filesystem = {
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
			window = {
				width = 32,
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files hidden=true<CR>", desc = "Find files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				prompt_prefix = " > ",
				selection_caret = " > ",
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		},
	},
	{
		"stevearc/aerial.nvim",
		cmd = "AerialToggle",
		keys = {
			{ "<leader>t", "<cmd>AerialToggle!<CR>", desc = "Symbols outline" },
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			layout = {
				min_width = 28,
				max_width = { 40, 0.3 },
			},
			attach_mode = "global",
			show_guides = true,
			filter_kind = false,
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"css",
					"go",
					"html",
					"javascript",
					"json",
					"lua",
					"markdown",
					"python",
					"regex",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"yaml",
				},
				highlight = { enable = true },
				indent = { enable = true },
				autotag = { enable = true },
			})
		end,
	},
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		build = ":MasonUpdate",
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = {
				bashls = {},
				clangd = {},
				cssls = {},
				emmet_language_server = {},
				gopls = {},
				html = {},
				jsonls = {},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								checkThirdParty = false,
							},
							telemetry = {
								enable = false,
							},
						},
					},
				},
				marksman = {},
				pyright = {},
				ts_ls = {},
			}

			local on_attach = function(_, bufnr)
				local lsp_map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
				end

				lsp_map("n", "gd", vim.lsp.buf.definition, "Goto definition")
				lsp_map("n", "gr", vim.lsp.buf.references, "Goto references")
				lsp_map("n", "gi", vim.lsp.buf.implementation, "Goto implementation")
				lsp_map("n", "K", vim.lsp.buf.hover, "Hover")
				lsp_map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
				lsp_map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
				lsp_map("n", "<leader>cf", function()
					vim.lsp.buf.format({ async = true })
				end, "Format buffer")
			end

			mason.setup()
			mason_lspconfig.setup({
				ensure_installed = vim.tbl_keys(servers),
			})
			mason_lspconfig.setup_handlers({
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					server.on_attach = on_attach
					lspconfig[server_name].setup(server)
				end,
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "buffer" },
				}),
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		cmd = "ConformInfo",
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disabled = {
					c = true,
					cpp = true,
				}
				if disabled[vim.bo[bufnr].filetype] then
					return nil
				end
				return { timeout_ms = 1000, lsp_format = "fallback" }
			end,
			formatters_by_ft = {
				css = { "prettierd", "prettier" },
				go = { "gofumpt", "goimports" },
				html = { "prettierd", "prettier" },
				javascript = { "prettierd", "prettier" },
				json = { "prettierd", "prettier" },
				lua = { "stylua" },
				markdown = { "prettierd", "prettier" },
				python = { "ruff_format", "black" },
				sh = { "shfmt" },
				typescript = { "prettierd", "prettier" },
				yaml = { "prettierd", "prettier" },
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				markdown = { "markdownlint" },
				python = { "ruff" },
				sh = { "shellcheck" },
				typescript = { "eslint_d" },
			}

			local lint_group = api.nvim_create_augroup("ivim_lint", { clear = true })
			api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_group,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}

require("lazy").setup({
	spec = plugins,
	defaults = {
		lazy = false,
		version = false,
	},
	install = {
		colorscheme = { "nord" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})