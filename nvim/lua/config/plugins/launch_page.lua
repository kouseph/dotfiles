return{
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		dashboard = {
			width = 60,
			row = nil, -- dashboard position. nil for center
			col = nil, -- dashboard position. nil for center
			pane_gap = 4, -- empty columns between vertical panes
			autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
			-- These settings are used by some built-in sections
			preset = {
				-- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
				---@type fun(cmd:string, opts:table)|nil
				pick = nil,
				-- Used by the `keys` section to show keymaps.
				-- Set your custom keymaps here.
				-- When using a function, the `items` argument are the default keymaps.
				---@type snacks.dashboard.Item[]
				keys = {
					{ icon = "", key = "f", desc = "Find File", action = function()
						require('telescope.builtin').find_files({
							hidden = true,
							no_ignore = true,
							no_ignore_parent = true,
							file_ignore_patterns = { "%.git/", "node_modules/", ".venv/", "venv/" },
						})
					end},
					{icon = "", key = "-", desc = "Open Directory", action = ":Oil"},
					{ icon = "", key = "g", desc = "Grep Text", action = function()
						require('telescope.builtin').live_grep({
							hidden = true,
							additional_args = function(_)
								return {
									"--no-ignore",      -- ignore .gitignore
									"--hidden",         -- include dotfiles
									"--glob", "!.git/*",
									"--glob", "!node_modules/*",
									"--glob", "!.venv/*",
									"--glob", "!venv/*",
								}
							end,
						})
					end},
					{ icon = "", key = "h", desc = "Harpoon", action = function()
						local ui = require("harpoon.ui")
						ui.toggle_quick_menu()
					end},
					{ icon = "", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
					-- { icon = "", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
					-- { icon = "", key = "s", desc = "Restore Session", section = "session" },
					{ icon = "", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
					{ icon = "", key = "q", desc = "Quit", action = ":qa" },
				},
				-- Used by the `header` section
				-- 				header =
				-- 				[[
				-- ================     ===============     ===============   ========  ========
				-- \\=.==.=.=.=.=.\\   //.=.=.=.=.=.=.\\   //.=.=.=.=.=.=.\\  \\.=.=.\\//=.=.=//
				-- ||.=.._____.=.=.|| ||.=.=._____.=.=.|| ||.=.=._____.=.=.|| ||=.=.=.\/=.=.=.||
				-- ||-.-||   ||.-.-|| ||-.-.||   ||.-.-|| ||-.-.||   ||.-.-|| ||.-.-.-.-.-.-.-||
				-- ||.=.||   ||-.-.|| ||.-.-||   ||=.=.|| ||.=.=||   ||=.=.|| ||=.=|/.=.=.=.-.||
				-- || .-||   ||. _-|| ||-_ .||   ||.=.=|| ||=.-.||   ||.-_-|| ||-_.|\ .=.=.=.=||
				-- ||.-.||   ||-.= || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|.=.||
				-- ||=..||   ||-'  || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
				-- ||.=.||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
				-- ||_-'||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
				-- ||   `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
				-- ||           .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
				-- ||        .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
				-- ||     .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
				-- ||   =='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
				-- ||.==    _-'                                                     `' |  /==.||
				-- =='   _-'                           V I M                           \/   `==
				-- \   _'                                                                `-_   /
				-- `''                                                                     ``']],
				-- 				header =
				-- 				[[
				-- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
				-- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⣿⣿⣿⣿⣿⠋⣿⣿⠁⠀⠀⢸⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
				-- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⣿⣿⣿⣿⠃⢸⣿⠇⠀⠀⠀⢸⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
				-- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⡿⠁⠀⠀⢸⣿⣿⣿⠃⠀⢸⡿⠀⠀⠀⠀⣸⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿
				-- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⡿⠁⠀⠀⠀⢸⣿⣿⠃⠀⠀⣼⠃⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿
				-- ⣿⣿⡿⠋⢸⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠒⣿⣿⣧⣀⠀⠀⣿⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿
				-- ⡿⠋⠀⠀⢸⡟⢸⡟⣿⠁⠀⠀⠀⠀⠀⠀⣿⣿⠀⠈⠻⣾⣿⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿
				-- ⠁⠀⠀⠀⠘⠇⠘⠀⣿⠀⠀⠀⠀⠀⠀⠀⣿⡟⠉⠉⠉⠙⡟⠋⠉⠙⠓⠶⣶⣤⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡟⢿⠁⣿⣿⣿⠸⣿
				-- ⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠠⣄⣀⡀⢀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣷⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠁⠀⢸⣿⠋⠃⠀⣿
				-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⡿⣿⣯⣥⣀⡀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⡷⡄⠀⠀⠀⠀⠀⠀⠀⠀⢠⠆⣰⡇⠀⠀⢸⣿⠀⠀⠀⣿
				-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣷⣼⠙⢥⣿⡿⠛⠳⠦⢤⣍⣙⣒⠲⣤⣄⠀⣻⣿⣿⣿⣿⣿⡇⠈⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣷⣶⣶⣾⣧⡤⠤⠴⣿
				-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⢷⡲⢤⣄⡀⠀⠀⠀⠀⠀⠉⠙⢻⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⡿⠋⠁⠀⢈⡿⠁⠀⠀⢰⣿
				-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⠶⢶⣶⣶⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⠧⡀⠀⠀⣼⠁⠀⠀⠀⢸⣿
				-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠛⣻⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⢸⣿⡟⢿⣛⣿⡿⠿⠶⠶⣶⡿⢤⣤⠄⢠⣿⣿
				-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠛⠛⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⢸⣿⣷⣤⣀⡀⠀⠀⠀⢀⣏⠠⡊⠀⣰⣿⣿⣿
				-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⡈⠉⠁⠀⠀⠀⠛⠋⠁⠀⣾⡿⢻⣿⡿
				-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣦⣀⣀⣤⠀⠀⠀⠀⢸⡟⠁⣾⠏⠀
				-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣶⠀⠀⠀⠀⢹⣿⣿⣿⠿⠋⠁⠀⠀⠀⢀⣿⠀⡸⠁⠀⢰
				-- ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⠀⠀⠀⢀⠈⠛⠛⠁⠀⠀⠀⠀⠀⠀⣸⡇⢰⠁⠀⢠⠏
				-- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ V I M ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				-- --

--
				header =
				[[
                                                                                
                  ░░░  ▄▄▄▄▄▄███▄▄▄▄▄                                    
                   ▄███████▀▀▀▀▀▀█▓▓▓▓▓▓██▄▄▄▄                          
                  ▐████▄▄    ■▓▓▓▓▀▀▀▀▀▀▀▀▀█████■                ██▄    
                   ▀█████████▄▄▄▄▄███████████▀▀             ▄▄  ████░▄▄▄
   ▐██▄            ▄▄▄▄▄▄▀▀▀▀▀▀▀▀▓▓▓▀░░░▄▄▄   ▄▄          ▐███▏▐██▓▄████
▄█▓░███▓ ▄▓▓▓▄▄████████████▄█████▄ ▄█████████▐███         ████▏██▀████▀ 
▐███▄███░▀████████▀▀   ▀▓█████▓▀██▓████▀▀  ███████      ▄█████ ■ ██▀    
 ▀████▓██ ▐██████       ▐████   ▐████▀    ▒████████▄  ▄███████          
   ▀███    ▀▀█████▄    ▄████   ▄████▏    ▄█████▀█████████▀ ███          
              ▀████▄ ▄████▐██▄███████▄▄▄███▓██▏ ▀██████▀   ▐██          
               ▀████████▀  ▀████▀▀████████▀▐██▏  ▀██▀▀     ▐██▏         
         ▓▓█    ▀████ ▀            ■███▄▄  ███              ██▏         
         ▀▀▀      ▀▀                ▀█████▄▓▀               ██▏         
           ░░     ▄████████████▄▄▄▄▄▄▄ ▀▀▀████▄▄   ▒▒▒      ██▏  ▄▄     
                  ▀▀████▀▀▀▀▀▀████████████▄▄▓▓▓███▄    ░░░░ ▐█▏ ■▀▀     
                                     ▀▀▀▀▀▀█████▓▓▓▓█▄▄     ▐█          
                                V I M          ▄█████████▄▄             
                                      ▄▄▄▄████████▀▀▀▀▀▀▀███▏           
                                  ▄▄█████▀▀▀▀              ▀■           
                               ▄███▀▀▀▀                                 
                             ■▀▀                                        
                                                                        ]],
--








			},
			-- item field formatters
			formats = {
				icon = function(item)
					if item.file and item.icon == "file" or item.icon == "directory" then
						return M.icon(item.file, item.icon)
					end
					return { item.icon, width = 2, hl = "icon" }
				end,
				footer = { "%s", align = "center" },
				header = { "%s", align = "center" },
				file = function(item, ctx)
					local fname = vim.fn.fnamemodify(item.file, ":~")
					fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
					if #fname > ctx.width then
						local dir = vim.fn.fnamemodify(fname, ":h")
						local file = vim.fn.fnamemodify(fname, ":t")
						if dir and file then
							file = file:sub(-(ctx.width - #dir - 2))
							fname = dir .. "/…" .. file
						end
					end
					local dir, file = fname:match("^(.*)/(.+)$")
					return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
				end,
			},
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
			},
		}
	}
}
