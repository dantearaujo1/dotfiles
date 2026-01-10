local util = require("utils")
local execute = vim.api.nvim_command
local fn = vim.fn

return {
	-- ============ SYNTAX PLUGINS ==============================
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"RRethy/nvim-treesitter-endwise",
		},
	},
	{
		"chrisgrieser/nvim-various-textobjs",
		lazy = false,
		opts = { keymaps = { useDefault = true } },
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
      require('nvim-ts-autotag').setup({
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false -- Auto close on trailing </
        },
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        per_filetype = {
          ["html"] = {
            enable_close = false
          }
        }
      })
		end
	},
	{
		"olrtg/nvim-emmet",
		keys = {
			{ "n", "v" },
			"<leader>xe",
		},
		config = function()
			vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
		end,
	},

	-- ============ DEBUGGER PLUGINS ==============================
	-- ============ REPL PLUGINS ==============================
	-- ============ LSP PLUGINS ==============================
	{
		"akinsho/flutter-tools.nvim",
		lazy = true,
		ft = "dart",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = function()
			require("flutter-tools").setup({})
		end,
	},
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "BufRead",
		opts = {
			-- your options here
		},
	}, -- Stops LSP that are not used and clean RAM
	{
		"theHamsta/nvim-dap-virtual-text",
	}, -- Virtual text showing variables info
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
	}, -- UI out of the box
	{
		"nvimtools/none-ls.nvim",
		event = "VeryLazy",
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		opts = {
			servers = {
			},
		},
		config = function(_, opts)
			for server, cfg in pairs(opts.servers) do
				cfg = cfg or {}
				cfg.capabilities = require("blink.cmp").get_lsp_capabilities(cfg.capabilities)
				vim.lsp.config(server, cfg)
			end
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				markdown = { "vale" },
				python = { "flake8" },
				bash = { "shellcheck" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				lua = { "selene" },
				sh = { "shellcheck" },
			}

			-- Run linting on save
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				group = vim.api.nvim_create_augroup("lint", { clear = true }),
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local conform = require("conform")
			conform.setup({
				format_on_save = { timeout_ms = 500, lsp_fallback = true },
				-- You can still define formatters_by_ft here,
				-- or let it use whatever Mason has put in your PATH
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettierd" },
					bash = { "beautysh" },
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-dap",
	},
	{
		"preservim/vimux",
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	--   -- ============ COMPLETION PLUGINS ============================
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = {
			"rafamadriz/friendly-snippets",
			"moyiz/blink-emoji.nvim",
			"MahanRahmati/blink-nerdfont.nvim",
			"fang2hou/blink-copilot",
			opts = {
				max_completions = 1, -- Global default for max completions
				max_attempts = 2, -- Global default for max attempts
				-- `kind_name` is not set, so the default value is "Copilot"
			},
		},

		-- use a release tag to download pre-built binaries
		version = "*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "enter",
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
				["<C-u>"] = { "scroll_documentation_up", "fallback" },
				["<C-d>"] = { "scroll_documentation_down", "fallback" },
			},
			cmdline = {
				keymap = {
					["<Tab>"] = {
						function(cmp)
							if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then
								return cmp.accept()
							end
						end,
						"show_and_insert",
						"select_next",
					},
				},
				completion = {
					menu = {
						auto_show = function(ctx)
							return vim.fn.getcmdtype() == ":"
							-- enable for inputs as well, with:
							-- or vim.fn.getcmdtype() == '@'
						end,
					},
					ghost_text = { enabled = true },
				},
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
				kind_icons = {
					Text = "󰉿",
					Method = "󰊕",
					Function = "󰊕",
					Constructor = "󰒓",

					Field = "󰜢",
					Variable = "󰆦",
					Property = "󰖷",

					Class = "󱡠",
					Interface = "󱡠",
					Struct = "󱡠",
					Module = "󰅩",

					Unit = "󰪚",
					Value = "󰦨",
					Enum = "󰦨",
					EnumMember = "󰦨",

					Keyword = "󰻾",
					Constant = "󰏿",

					Snippet = "󱄽",
					Color = "󰏘",
					File = "󰈔",
					Reference = "󰬲",
					Folder = "󰉋",
					Event = "󱐋",
					Operator = "󰪚",
					TypeParameter = "󰬛",
				},
			},
			signature = {
				window = {
					border = "rounded",
				},
			},
			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
					update_delay_ms = 50,
					treesitter_highlighting = true,
					window = { border = "rounded" },
				},
				ghost_text = {
					enabled = true,
				},
				menu = {
					border = "rounded",
					draw = {
						components = {
							kind_icon = {
								ellipsis = false,
								text = function(ctx)
									local lspkind = require("lspkind")
									local icon = ctx.kind_icon
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											icon = dev_icon
										end
									else
										icon = require("lspkind").symbolic(ctx.kind, {
											mode = "symbol",
										})
									end

									return icon .. ctx.icon_gap
								end,

								highlight = function(ctx)
									local hl = "BlinkCmpKind" .. ctx.kind
										or require("blink.cmp.completion.windows.render.tailwind").get_hl(ctx)
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											hl = dev_hl
										end
									end
									return hl
								end,
							},
						},
						columns = function(ctx)
							if ctx.mode == "cmdline" then
								return { { "label" } }
							else
								return { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } }
							end
						end,
						treesitter = { "lsp" },
					},
				},
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = {
					"lazydev",
					"lsp",
					"copilot",
					"path",
					"snippets",
					"buffer",
				},
				per_filetype = {
					sql = { "snippets", "dadbod", "buffer" },
					mysql = { "snippets", "dadbod", "buffer" },
				},
				providers = {
					lsp = {
						name = "LSP",
						module = "blink.cmp.sources.lsp",
						async = true,
					},
					copilot = {
						module = "blink-copilot",
						name = "copilot",
						async = true,
						score_offset = 100,
						opts = {
							max_completions = 3,
						},
					},
					dadbod = {
						name = "Dadbod",
						module = "vim_dadbod_completion.blink",
					},
					nerdfont = {
						module = "blink-nerdfont",
						name = "Nerd Fonts",
						score_offset = 15,
						opts = { insert = true },
					},
					emoji = {
						module = "blink-emoji",
						name = "Emoji",
						score_offset = 25, -- Tune by preference
						opts = { insert = true }, -- Insert emoji (default) or complete its name
						should_show_items = function()
							return vim.tbl_contains(
								-- Enable emoji completion only for git commits and markdown.
								-- By default, enabled for all file-types.
								{ "gitcommit", "markdown", "text", "html" },
								vim.o.filetype
							)
						end,
					},
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
		opts_extend = { "sources.default" },
	},
	-- Terminal ==================================================================
	{
		"skywind3000/asyncrun.vim",
		event = "VeryLazy",
		cmd = "AsyncRun",
		event = "VeryLazy",
	},
	{
		"skywind3000/asynctasks.vim",
		event = "VeryLazy",
		cmd = { "AsyncTask", "AsyncTaskList", "AsyncTaskEdit" },
	},
	-- Browser Navigation Plugins ==================================================
	{
		"xiyaowong/link-visitor.nvim",
		opts = {},
	},
	{
		"sontungexpt/url-open",
		event = "VeryLazy",
		cmd = "URLOpenUnderCursor",
		keys = {
			{ "<leader>ob", "<cmd>URLOpenUnderCursor<cr>" },
		},
		config = function()
			local status_ok, url_open = pcall(require, "url-open")
			if not status_ok then
				return
			end
			url_open.setup({})
		end,
	},
	-- Utils Pluggins =============================================================
  {
    "uhs-robert/sshfs.nvim",
    opts = {
      -- Refer to the configuration section below
      -- or leave empty for defaults
    },
  },
  {
    "colomb8/rambo.nvim",
    config = function()
      require("rambo").setup({
        -- operations_key = 'C', -- 'C' or 'M'
        -- c_right_mode = 'bow', -- 'bow' or 'eow'
      })
    end,
  }, -- A lot of insert mode mappings
	{
		"mistricky/codesnap.nvim",
		lazy = true,
		event = "VeryLazy",
		build = "make build_generator",
		cmd = { "CodeSnapASCII", "CodeSnapSave" },
		keys = {
			{
				"<leader>sn",
				"<cmd>CodeSnapASCII<cr>",
				mode = { "x", "n", "v" },
				desc = "Save selected code snapshot into clipboard",
			},
			{
				"<leader>sN",
				"<cmd>CodeSnapSave<cr>",
				mode = { "x", "n", "v" },
				desc = "Save selected code snapshot in ~/Pictures",
			},
		},
		opts = {
			save_path = "~/Pictures/Screenshots/",
			has_breadcrumbs = true,
			bg_theme = "bamboo",
		},
	}, -- take snapshots of the code
  {
    "gennaro-tedesco/nvim-jqx",
    event = {"BufReadPost"},
    ft = { "json", "yaml" },
  }, -- Better way to check json and yaml data JqxQuery and JqxList
  {
    "alex-popov-tech/store.nvim",
    dependencies = { "OXY2DEV/markview.nvim" },
    cmd = "Store"
  }, -- A Store for plugins
	{
		"kevinhwang91/nvim-bqf",
		event = "VeryLazy",
		ft = "qf",
	},
	{
		"chrisgrieser/nvim-puppeteer",
		lazy = false, -- plugin lazy-loads itself. Can also load on filetypes.
	}, -- change  string to f-strings or template strings automatically
	{
		"OXY2DEV/helpview.nvim",
		lazy = false,
	},
	-- {
	--     "jake-stewart/multicursor.nvim",
	--     branch = "1.0",
	--     config = function()
	--         local mc = require("multicursor-nvim")
	--
	--         mc.setup()
	--
	--         local set = vim.keymap.set
	--
	--         -- Add or skip cursor above/below the main cursor.
	--         set({"n", "v"}, "<up>",
	--             function() mc.lineAddCursor(-1) end)
	--         set({"n", "v"}, "<down>",
	--             function() mc.lineAddCursor(1) end)
	--         set({"n", "v"}, "<localleader><up>",
	--             function() mc.lineSkipCursor(-1) end)
	--         set({"n", "v"}, "<localleader><down>",
	--             function() mc.lineSkipCursor(1) end)
	--
	--         -- Add or skip adding a new cursor by matching word/selection
	--         set({"n", "v"}, "<localleader>n",
	--             function() mc.matchAddCursor(1) end)
	--         set({"n", "v"}, "<localleader>s",
	--             function() mc.matchSkipCursor(1) end)
	--         set({"n", "v"}, "<localleader>N",
	--             function() mc.matchAddCursor(-1) end)
	--         set({"n", "v"}, "<localleader>S",
	--             function() mc.matchSkipCursor(-1) end)
	--
	--         -- Add all matches in the document
	--         set({"n", "v"}, "<localleader>A", mc.matchAllAddCursors)
	--
	--         -- You can also add cursors with any motion you prefer:
	--         -- set("n", "<right>", function()
	--         --     mc.addCursor("w")
	--         -- end)
	--         -- set("n", "<leader><right>", function()
	--         --     mc.skipCursor("w")
	--         -- end)
	--
	--         -- Rotate the main cursor.
	--         set({"n", "v"}, "<left>", mc.nextCursor)
	--         set({"n", "v"}, "<right>", mc.prevCursor)
	--
	--         -- Delete the main cursor.
	--         set({"n", "v"}, "<localleader>x", mc.deleteCursor)
	--
	--         -- Add and remove cursors with control + left click.
	--         set("n", "<c-leftmouse>", mc.handleMouse)
	--
	--         -- Easy way to add and remove cursors using the main cursor.
	--         set({"n", "v"}, "<c-q>", mc.toggleCursor)
	--
	--         -- Clone every cursor and disable the originals.
	--         set({"n", "v"}, "<localleader><c-q>", mc.duplicateCursors)
	--
	--         set("n", "<esc>", function()
	--             if not mc.cursorsEnabled() then
	--                 mc.enableCursors()
	--             elseif mc.hasCursors() then
	--                 mc.clearCursors()
	--             else
	--                 -- Default <esc> handler.
	--             end
	--         end)
	--
	--         -- bring back cursors if you accidentally clear them
	--         set("n", "<localleader>gv", mc.restoreCursors)
	--
	--         -- Align cursor columns.
	--         set("n", "<localleader>a", mc.alignCursors)
	--
	--         -- Split visual selections by regex.
	--         set("v", "S", mc.splitCursors)
	--
	--         -- Append/insert for each line of visual selections.
	--         set("v", "I", mc.insertVisual)
	--         set("v", "A", mc.appendVisual)
	--
	--         -- match new cursors within visual selections by regex.
	--         set("v", "M", mc.matchCursors)
	--
	--         -- Rotate visual selection contents.
	--         set("v", "<localleader>t",
	--             function() mc.transposeCursors(1) end)
	--         set("v", "<localleader>T",
	--             function() mc.transposeCursors(-1) end)
	--
	--         -- Jumplist support
	--         set({"v", "n"}, "<c-i>", mc.jumpForward)
	--         set({"v", "n"}, "<c-o>", mc.jumpBackward)
	--
	--         -- Customize how cursors look.
	--         local hl = vim.api.nvim_set_hl
	--         hl(0, "MultiCursorCursor", { link = "Cursor" })
	--         hl(0, "MultiCursorVisual", { link = "Visual" })
	--         hl(0, "MultiCursorSign", { link = "SignColumn"})
	--         hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
	--         hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
	--         hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
	--     end
	-- },
	{
		"jiaoshijie/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		opts = {},
		config = true,
		keys = { -- load the plugin only when using it's keybinding:
			{ "<leader>ut", "<cmd>lua require('undotree').toggle()<cr>" },
		},
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufEnter",
	},
	{
		"arnamak/stay-centered.nvim",
		opts = {},
	}, -- autocmds for always stay centered
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			dashboard = { enabled = false },
      debug = { enabled = true },
			explorer = { enabled = true },
      indent = { enabled = true },
			input = { enabled = true },
			image = { enabled = true },
			notifier = {
				enabled = true,
				timeout = 3000,
			},
			picker = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = false },
			scroll = { enabled = false },
			statuscolumn = { enabled = true },
			words = { enabled = false },
			styles = {
				notification = {
					wo = { wrap = true }, -- Wrap notifications
				},
			},
		},
		keys = {
			-- Top Pickers & Explorer
			{
				"<leader><space>",
				function()
					Snacks.picker.smart()
				end,
				desc = "Smart Find Files",
			},
      { "<leader>q", function() require('dante/custom').pick_asynctask() end, desc = "Run Tasks" },
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>f:",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader>fN",
				function()
					Snacks.picker.notifications()
				end,
				desc = "Notification History",
			},
			{
				"<leader>fn",
				function()
					Snacks.picker.files({ cwd = "~/Notes/", layout = "telescope" })
				end,
				desc = "Find Notes",
			},
			{
				"<leader>fw",
				function()
          if util.getOS() == "Linux" then
            Snacks.picker.files({ cwd = "~/dev/projects", layout = "telescope" })
          else
            Snacks.picker.files({ cwd = "/mnt/c/users/dante.clementino/code", layout = "telescope" })
          end
				end,
				desc = "Find Windows Files",
			},
			{
				"<leader>fe",
				function()
					Snacks.explorer()
				end,
				desc = "File Explorer",
			},
			{
				"<leader>fz",
				function()
					Snacks.picker.zoxide()
				end,
				desc = "Project with Zoxide",
			},
			-- find
			{
				"<leader>f,",
				function()
					Snacks.picker.files({
						cwd = vim.fn.stdpath("config"),
						exclude = { "undodir" },
						layout = "telescope",
					})
				end,
				desc = "Find Config File",
			},
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fG",
				function()
					Snacks.picker.git_files()
				end,
				desc = "Find Git Files",
			},
			{
				"<leader>fp",
				function()
					Snacks.picker.projects()
				end,
				desc = "Projects",
			},
			{
				"<leader>fr",
				function()
					Snacks.picker.recent()
				end,
				desc = "Recent",
			},
			-- GIT
			{
				"<leader>gB",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Git Browse",
				mode = { "n", "v" },
			},
			{
				"<M-g>",
				function()
					Snacks.lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>gb",
				function()
					Snacks.picker.git_branches({ layout = "select" })
				end,
				desc = "Git Branches",
			},
			{
				"<leader>gl",
				function()
					Snacks.picker.git_log({
						finder = "git_log",
						format = "git_log",
						preview = "git_show",
						confirm = "git_checkout",
						layout = "telescope",
					})
				end,
				desc = "Git Log",
			},
			{
				"<localleader>gl",
				function()
					Snacks.picker.git_log_line()
				end,
				desc = "Git Log Line",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git Status",
			},
			{
				"<localleadert>gs",
				function()
					Snacks.picker.git_stash()
				end,
				desc = "Git Stash",
			},
			{
				"<leader>gd",
				function()
					Snacks.picker.git_diff()
				end,
				desc = "Git Diff (Hunks)",
			},
			{
				"<leader>gf",
				function()
					Snacks.picker.git_log_file()
				end,
				desc = "Git Log File",
			},
			-- Grep
			{
				"<leader>f<",
				function()
					Snacks.picker.grep({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "Grep Config File",
			},
			{
				"<leader>f>",
				function()
					Snacks.picker.grep({ cwd = vim.fs.joinpath(vim.fn.stdpath("config"), "lazy") })
				end,
				desc = "Grep Config File",
			},
			{
				"<leader>fL",
				function()
					Snacks.picker.lines()
				end,
				desc = "Buffer Lines",
			},
			{
				"<leader>fB",
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = "Grep Open Buffers",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>fW",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Visual selection or word",
				mode = { "n", "x" },
			},
			-- search
			{
				'<leader>f"',
				function()
					Snacks.picker.registers()
				end,
				desc = "Registers",
			},
			{
				"<leader>f/",
				function()
					Snacks.picker.search_history()
				end,
				desc = "Search History",
			},
			{
				"<leader>fa",
				function()
					Snacks.picker.autocmds()
				end,
				desc = "Autocmds",
			},
			{
				"<leader>fc",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command History",
			},
			{
				"<leader>fC",
				function()
					Snacks.picker.commands()
				end,
				desc = "Commands",
			},
			{
				"<leader>fd",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "Diagnostics",
			},
			{
				"<leader>fD",
				function()
					Snacks.picker.diagnostics_buffer()
				end,
				desc = "Buffer Diagnostics",
			},
			{
				"<leader>fh",
				function()
					Snacks.picker.help()
				end,
				desc = "Help Pages",
			},
			{
				"<leader>fH",
				function()
					Snacks.picker.highlights()
				end,
				desc = "Highlights",
			},
			{
				"<leader>fi",
				function()
					Snacks.picker.icons()
				end,
				desc = "Icons",
			},
			{
				"<leader>fj",
				function()
					Snacks.picker.jumps()
				end,
				desc = "Jumps",
			},
			{
				"<leader>fk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Keymaps",
			},
			{
				"<leader>fl",
				function()
					Snacks.picker.loclist()
				end,
				desc = "Location List",
			},
			{
				"<leader>ft",
				function()
					Snacks.picker.todo_comments()
				end,
				desc = "Todo",
			},
			{
				"<leader>fT",
				function()
					Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
				end,
				desc = "Todo/Fix/Fixme",
			},
			{
				"<leader>fmk",
				function()
					Snacks.picker.marks()
				end,
				desc = "Marks",
			},
			{
				"<leader>fmn",
				function()
					Snacks.picker.man()
				end,
				desc = "Man Pages",
			},
			{
				"<leader>fy",
				function()
					Snacks.picker.cliphist()
				end,
				desc = "Clip history",
			},
			{
				"<leader>fP",
				function()
					Snacks.picker.lazy()
				end,
				desc = "Search for Plugin Spec",
			},
			{
				"<leader>fq",
				function()
					Snacks.picker.qflist()
				end,
				desc = "Quickfix List",
			},
			{
				"<leader>fR",
				function()
					Snacks.picker.resume()
				end,
				desc = "Resume",
			},
			{
				"<leader>fu",
				function()
					Snacks.picker.undo()
				end,
				desc = "Undo History",
			},
			{
				"<leader>uC",
				function()
					Snacks.picker.colorschemes()
				end,
				desc = "Colorschemes",
			},
			-- LSP
			{
				"gd",
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = "Goto Definition",
			},
			{
				"gD",
				function()
					Snacks.picker.lsp_declarations()
				end,
				desc = "Goto Declaration",
			},
			{
				"gr",
				function()
					Snacks.picker.lsp_references()
				end,
				nowait = true,
				desc = "References",
			},
			{
				"gI",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "Goto Implementation",
			},
			{
				"gy",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "Goto T[y]pe Definition",
			},
			{
				"<leader>ss",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "LSP Symbols",
			},
			{
				"<leader>sS",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "LSP Workspace Symbols",
			},
			-- Other
			{
				"<leader>z",
				function()
					Snacks.zen()
				end,
				desc = "Toggle Zen Mode",
			},
			{
				"<leader>Z",
				function()
					Snacks.zen.zoom()
				end,
				desc = "Toggle Zoom",
			},
			{
				"<leader>.",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},
			{
				"<leader>S",
				function()
					Snacks.scratch.select()
				end,
				desc = "Select Scratch Buffer",
			},
			{
				"<leader>n",
				function()
					Snacks.notifier.show_history()
				end,
				desc = "Notification History",
			},
			{
				"<leader>bd",
				function()
					Snacks.bufdelete()
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>cR",
				function()
					Snacks.rename.rename_file()
				end,
				desc = "Rename File",
			},
			{
				"<leader>un",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Dismiss All Notifications",
			},
			{
				"<c-/>",
				function()
					Snacks.terminal()
				end,
				desc = "Toggle Terminal",
			},
			{
				"<c-_>",
				function()
					Snacks.terminal()
				end,
				desc = "which_key_ignore",
			},
			{
				"]]",
				function()
					Snacks.words.jump(vim.v.count1)
				end,
				desc = "Next Reference",
				mode = { "n", "t" },
			},
			{
				"[[",
				function()
					Snacks.words.jump(-vim.v.count1)
				end,
				desc = "Prev Reference",
				mode = { "n", "t" },
			},
			{
				"<leader>N",
				desc = "Neovim News",
				function()
					Snacks.win({
						file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
						width = 0.6,
						height = 0.6,
						wo = {
							spell = false,
							wrap = false,
							signcolumn = "yes",
							statuscolumn = " ",
							conceallevel = 3,
						},
					})
				end,
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- Setup some globals for debugging (lazy-loaded)
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end
					vim.print = _G.dd -- Override print to use snacks for `:=` command

					-- Create some toggle mappings
					Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
					Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
					Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
					Snacks.toggle.diagnostics():map("<leader>ud")
					Snacks.toggle.line_number():map("<leader>ul")
					Snacks.toggle
						.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
						:map("<leader>uc")
					Snacks.toggle.treesitter():map("<leader>uT")
					Snacks.toggle
						.option("background", { off = "light", on = "dark", name = "Dark Background" })
						:map("<leader>ub")
					Snacks.toggle.inlay_hints():map("<leader>uh")
					Snacks.toggle.indent():map("<leader>ui")
					Snacks.toggle.dim():map("<leader>uD")
				end,
			})
		end,
	},
	{
		"echasnovski/mini.nvim",
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
			},
		},
		config = function()
			require("mini.align").setup()
			require("mini.cursorword").setup()
			require("mini.ai").setup()
			require("mini.move").setup()
			require("mini.operators").setup()
			require("mini.surround").setup()
			require("mini.splitjoin").setup()
			require("mini.comment").setup({
				options = {
					custom_commentstring = function()
						return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
					end,
				},
			})
		end,
	},
  {
    "booperlv/nvim-gomove",
    config = function()
      require("gomove").setup({})
    end
  },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			preset = "helix",
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "➜", -- symbol used between a key and it's label
				group = " ", -- symbol prepended to a group
				ellipsis = "…",
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"ggandor/leap.nvim",
	},
	{
		"hinell/duplicate.nvim",
	}, -- Duplicate lines
	{
		"foosoft/vim-argwrap",
	}, -- Strenght argument wrapping and unwrapping
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		opts = {
			--Config goes here
		},
	},
	{
		"bkad/camelcasemotion",
	},
	{
		"propet/toggle-fullscreen.nvim",
		event = "VeryLazy",
	}, -- Toggle fullScreen with <leader>z
	{
		"folke/zen-mode.nvim",
		event = "VeryLazy",
	}, -- Distraction Free
	{
		"folke/twilight.nvim",
		event = "VeryLazy",
	}, -- Dim buffers

	{
		"uga-rosa/ccc.nvim",
		keys = {
			{ "<leader>cc", "<cmd>CccPick<CR>", desc = "Color picker" },
		},
		config = function()
			-- create hydras in here
			require("ccc").setup({
				ccc_option_highlighter_auto_enable = true,
			})
		end,
	}, -- Color Picker

	-- Language Specifics ==========================================================
	-- Documentation ---------------------------------------------------------------
	-- Processing ------------------------------------------------------------------
	-- {
	--   'sophacles/vim-processing',
	--   ft = 'pde',
	-- }, -- Processing plugin helper
	-- LATEX ========
	{
	  'lervag/vimtex',
	  ft = "tex",
	  enabled = function() return util.getOS() == "Linux" end
	},
	{
	  'matze/vim-tex-fold',
	  ft = "tex",
	  enabled = function() return util.getOS() == "Linux" end
	},
	{
	  'aspeddro/pandoc.nvim',
	  event = "VeryLazy",
	  config = function()
	    require 'pandoc'.setup()
	  end
	},
	-- HTTP ========
  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>Rs", desc = "Send request" },
      { "<leader>Ra", desc = "Send all requests" },
      { "<leader>Rb", desc = "Open scratchpad" },
    },
    ft = {"http", "rest"},
    opts = {
      global_keymaps = false,
      global_keymaps_prefix = "<leader>R",
      kulala_keymaps_prefix = "",
    },
  },
	-- JSON ========
  { 'yochem/jq-playground.nvim' },
	-- GIT ========
	{
		"moyiz/git-dev.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>go",
				function()
					local repo = vim.fn.input("Repository name / URI: ")
					if repo ~= "" then
						require("git-dev").open(repo)
					end
				end,
				desc = "[O]pen a remote git repository",
			},
		},
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	}, -- Super fast git decorations implemented purely in Lua/Teal
	{
		"sindrets/diffview.nvim",
		command = "DiffviewOpen",
		cond = is_git_root,
		keys = {
			{
				"<leader>gg",
				function()
					util.toggle_diffview("DiffviewOpen")
				end,
				desc = "Diff Index",
			},
			{
				"<leader>gM",
				function()
					util.toggle_diffview("DiffviewOpen master..HEAD")
				end,
				desc = "Diff master",
			},
			{
				"<leader>gD",
				function()
					util.toggle_diffview("DiffviewOpen dev..HEAD")
				end,
				desc = "Diff master",
			},
			{
				"<leader>gh",
				function()
					util.toggle_diffview("DiffviewFileHistory %")
				end,
				desc = "Open diffs for current File",
			},
		},
	}, -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.

	-- Java ========
  {
    "nvim-java/nvim-java",
  },
  {
    'jkeresman01/spring-initializr.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('spring-initializr').setup()
    end
  },
  {
      'javiorfo/nvim-springtime',
      lazy = true,
      cmd = { "Springtime", "SpringtimeUpdate" },
      dependencies = {
          "javiorfo/nvim-popcorn",
          "javiorfo/nvim-spinetta",
          "hrsh7th/nvim-cmp"
      },
      build = function()
          require'springtime.core'.update()
      end,
      opts = {
          -- This section is optional
          -- If you want to change default configurations
          -- In packer.nvim use require'springtime'.setup { ... }

          -- Springtime popup section
          spring = {
              -- Project: Gradle, Gradle Kotlin and Maven (Gradle default)
              project = {
                  selected = 1
              },
              -- Language: Java, Kotlin and Groovy (Java default)
              language = {
                  selected = 1
              },
              -- Packaging: Jar and War (Jar default)
              packaging = {
                  selected = 1
              },
              -- Project Metadata defaults:
              -- Change the default values as you like
              -- This can also be edited in the popup
              project_metadata = {
                  group = "br.com.dantedev",
                  artifact = "demo",
                  name = "demo",
                  package_name = "br.com.dantedev.demo",
                  version = "0.0.1-SNAPSHOT"
              }
          },
              -- Highlight links to Title and sections for changing colors
              style = {
                  title_link = "Boolean",
                  section_link = "Type"
              }
          },

          -- Workspace is where the generated Spring project will be saved
    workspace = {
    -- Default where Neovim is open
    path = vim.fn.expand("%:p:h"),

    -- Spring Initializr generates a zip file
    -- Decompress the file by default
    decompress = true,

    -- If after generation you want to open the folder
    -- Opens the generated project in Neovim by default
    open_auto = true
    },

    -- This could be enabled for debugging purposes
    -- Generates a springtime.log with debug and errors.
    internal = {
      log_debug = false
    }
  },

	-- Typescript ========
	-- C++ ========
	-- DATABASE Specifics =========================================================
	{
		"tpope/vim-dadbod",
	}, -- Vim plugin to interact with databases {Mongo,JQ,Postgre}
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
	{ "kristijanhusak/vim-dadbod-completion" }, -- Completion for dadbod

	-- CLI Pluggins ===============================================================
	{
		"kawre/leetcode.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			-- configuration goes here
			cn = {
				enabled = false,
				translator = true,
				translate_problems = true,
			},
			injector = { ---@type table<lc.lang, lc.inject>
				["python3"] = {
					before = true,
				},
				["cpp"] = {
					before = { "#include <bits/stdc++.h>", "using namespace std;" },
					after = "int main() {}",
				},
				["java"] = {
					before = "import java.util.*;",
				},
			},
		},
	},
	-- {
	--   "ramilito/kubectl.nvim",
	--   event = "VeryLazy",
	--   lazy = true,
	--   config = function()
	--     require("kubectl").setup()
	--     vim.keymap.set("n", "<leader>kk", '<cmd>lua require("kubectl").toggle()<cr>', { noremap = true, silent = true , desc = "Toggler Kubectl"})
	--   end,
	-- },
	-- Note Taking Plugins ===================================================
	-- UI Pluggins ===========================================================
	-- PREVIEWERS
	-- MARKDOWN
  {
    "bngarren/checkmate.nvim",
    ft = "markdown", -- Lazy loads for Markdown files matching patterns in 'files'
    opts = {
      -- files = { "*.md" }, -- any .md file (instead of defaults)
    },
  },
	{
		"MeanderingProgrammer/render-markdown.nvim",
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },            -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
		config = function()
			require("render-markdown").setup({
				file_types = { "markdown", "md", "codecompanion" },
				render_modes = { "n", "no", "c", "t", "i", "ic" },
				code = {
					sign = false,
					border = "thin",
					position = "right",
					width = "block",
					above = "▁",
					below = "▔",
					language_left = "█",
					language_right = "█",
					language_border = "▁",
					left_pad = 1,
					right_pad = 1,
				},
				heading = {
					sign = false,
					width = "block",
					backgrounds = {
						-- choose hlgroups where bg is the color you want your headings to be
						"MiniStatusLineModeVisual",
						"MiniStatusLineModeCommand",
						"MiniStatusLineModeReplace",
						"MiniStatusLineModeNormal",
						"MiniStatusLineModeOther",
						"MiniStatusLineModeInsert",
					},
					left_pad = 1,
					right_pad = 0,
					position = "right",
					icons = function(ctx)
						return (""):rep(ctx.level) .. ""
					end,
				},
			})
		end,
	},
	-- LATEX

	-- BUFFERS
	{
	  "folke/trouble.nvim",
	  opts = {}, -- for default options, refer to the configuration section for custom setup.
	  cmd = "Trouble",
	  keys = {
	    {
	      "<leader>xx",
	      "<cmd>Trouble diagnostics toggle<cr>",
	      desc = "Diagnostics (Trouble)",
	    },
	    {
	      "<leader>xX",
	      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	      desc = "Buffer Diagnostics (Trouble)",
	    },
	    {
	      "<leader>cs",
	      "<cmd>Trouble symbols toggle focus=false<cr>",
	      desc = "Symbols (Trouble)",
	    },
	    {
	      "<leader>cl",
	      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	      desc = "LSP Definitions / references / ... (Trouble)",
	    },
	    {
	      "<leader>xL",
	      "<cmd>Trouble loclist toggle<cr>",
	      desc = "Location List (Trouble)",
	    },
	    {
	      "<leader>xQ",
	      "<cmd>Trouble qflist toggle<cr>",
	      desc = "Quickfix List (Trouble)",
	    },
	  },
	},
	{ "onsails/lspkind-nvim" },
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	}, -- for symbols in completion
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("dante/lspsaga")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
		event = "LspAttach",
	},
	{
		"nvim-zh/colorful-winsep.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		config = function()
			require("colorful-winsep").setup()
		end,
	},
	-- THEMES|UI ==============================================================
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "ellisonleao/gruvbox.nvim", priority = 1000, lazy = true },
	{ "rebelot/kanagawa.nvim" },
  { "serhez/teide.nvim", lazy = false, priority = 1000, opts = {}, },
  {
    'everviolet/nvim', name = 'evergarden',
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    opts = {
      theme = {
        variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
        accent = 'green',
      },
      editor = {
        transparent_background = false,
        sign = { color = 'none' },
        float = {
          color = 'mantle',
          solid_border = false,
        },
        completion = {
          color = 'surface0',
        },
      },
    }
  },
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				extra_groups = {
					"FoldColumn",
					"WinBar",
					"WinBarNC",
					-- Saga
					"SagaWinbarFileName",
					"SagaWinbarFolderName",
					"SagaWinbarSep",
					"SagaText",
					"SagaDetail",
					"SagaSep",
					"SagaToggle",
					"SagaBorder",
					"SagaNormal",
					-- Snacks
					"SnacksPickerDir",
					"SnacksPickerTree",
					"SnacksPickerCol",
					"SnacksPickerComment",
					"SnacksWinKeySep",
					"SnacksPickerDimmed",
					-- StatusLine
					"lualine_b_normal",
					"lualine_x_filetype_DevIconLua_normal",
					"lualine_x_filetype_DevIconJs_normal",
					"lualine_x_filetype_DevIconDefault_normal",
					"lualine_c_normal",
					"StatusLineNC",
					"StatusLine",
					-- CMP
					"CmpItemAbbr",
					"CmpDocumentationBorder",
					"CmpDocumentation",
					"NotifyBackground",
					-- Floating
					"LspFloatWinNormal",
					"Normal",
					"FloatBorder",
					"NormalFloat",
				},
				exclude_groups = {
					"WhichKeyTitle",
				},
			})
		end,
	},
  { "zaldih/themery.nvim", lazy = false, config = function() require("themery").setup({
    themes = {
      "teide","teide-darker", "teide-dark","teide-dimmed","teide-light","evergarden","kanagawa","gruvbox","catppuccin"
    },
  }) end }, -- theme switcher
	-- ColorColumn ===========================
	{ "xiyaowong/virtcolumn.nvim" },
	-- ICONS THEMES==================================================
	{ "ryanoasis/vim-devicons" },
	{ "yamatsum/nvim-web-nonicons" },
	{ "nvim-tree/nvim-web-devicons", config = function() require("nvim-web-devicons").setup() end, },
	-- Folding ==================================================
  { "chrisgrieser/nvim-origami", event = "VeryLazy", opts = {},}, -- needed even when using default config
	-- My Pluggins ===========================================================
	-- {
	--   '/tcc/',
	--   dev = true,
	--   enabled = function() return util.getOS() == "Linux" end
	-- },
	{
		"/NeoQlik/",
		dev = true,
		enabled = function()
			return util.getOS() == "Linux"
		end,
	},
	{
		"/cursor/",
		dev = true,
		enabled = function()
			return util.getOS() == "Linux"
		end,
	},
	-- STATUS LINE PLUGINS ========================================================
	{ "pysan3/pathlib.nvim" },
	{
		"nvim-lualine/lualine.nvim",
	},
	{
		"SmiteshP/nvim-navic",
		dependencies = "neovim/nvim-lspconfig",
	},
	{
		"christoomey/vim-tmux-navigator",
		-- enabled = function() return util.getOS() == 'Linux' end
		enabled = function()
			return not (vim.fn.executable("tmux") and string.find(vim.fn.expandcmd("$TERM"), "xterm-kitty"))
		end,
	},
	{
		"mikesmithgh/kitty-scrollback.nvim",
		enabled = true,
		lazy = true,
		cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
		event = { "User KittyScrollbackLaunch" },
		config = function()
			require("kitty-scrollback").setup()
		end,
	},
	-- AI PLUGINS ================================================================
  {
      "ravitemer/mcphub.nvim",
      dependencies = {
          "nvim-lua/plenary.nvim",  -- Required for Job and HTTP requests
      },
      -- cmd = "MCPHub", -- lazily start the hub when `MCPHub` is called
      build = "bundled_build.lua", -- Installs required mcp-hub npm module
      opts = {
        use_bundled_binary = true,
      },
  },
	{
		"0xrusowsky/nvim-ctx-ingest",
		dependencies = {
			"nvim-web-devicons", -- required for file icons
		},
		keys = { "<localleader>i" },
		config = function()
			require("nvim-ctx-ingest").setup({
				-- your config options here
			})
		end,
	},
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    opts = {
      provider = "perplexity",
      providers = {
        perplexity = {
          __inherited_from = "openai",
          api_key_name = "PERPLEXITY_API_KEY",
          endpoint = "https://api.perplexity.ai",
          model = "llama-3.1-sonar-large-128k-online",
          -- model = "claude",
        },
        gemini = {
          model = "gemini-2.5-pro-preview-03-25",
          extra_request_body = {
            temperature = 0,
            max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
            --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
          }
        },
        openai = {
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
          timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
          extra_request_body = {
            temperature = 0,
            max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
            --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
          }
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
    },
  },
}
