-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Lets setup some remaps first

local function save_build_run()
	-- Save the current file
	vim.api.nvim_command('w')

	-- Build the current file using g++, run it if there is no error
	-- or show you the error if there is one.
	local cmd =
	'!g++ src/*.cpp -Isrc -std=c++17 -o bin/sfmlgame -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio || cat *.build'
	vim.api.nvim_command(cmd)
end

return {
	{
		'ThePrimeagen/harpoon',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		opts = {
			lazy = false
		},
		config = function()
			require('harpoon').setup()

			vim.keymap.set('n', '<C-a>', require('harpoon.mark').add_file,
				{ desc = 'Harpoon [A]dd file' })

			vim.keymap.set('n', '<C-e>', require('harpoon.ui').toggle_quick_menu,
				{ desc = 'Harpoon Quick m[e]nu' })

			vim.keymap.set('n', '<C-,>', require('harpoon.ui').nav_prev,
				{ desc = '[H]arpoon previous [,]' })

			vim.keymap.set('n', '<C-.>', require('harpoon.ui').nav_next, { desc = '[H]arpoon next [.]' })

			vim.keymap.set('n', '<C-h>', function() require('harpoon.ui').nav_file(1) end,
				{ desc = '[H]arpoon nav file 1.' })

			vim.keymap.set('n', '<C-t>', function() require('harpoon.ui').nav_file(2) end,
				{ desc = '[H]arpoon nav file 2.' })

			vim.keymap.set('n', '<C-n>', function() require('harpoon.ui').nav_file(3) end,
				{ desc = '[H]arpoon nav file 3.' })

			vim.keymap.set('n', '<C-s>', function() require('harpoon.ui').nav_file(4) end,
				{ desc = '[H]arpoon nav file 4.' })
		end,
	},
	{
		vim.keymap.set('n', '<C-b>', save_build_run, {
			noremap = true,
			silent = true
		}),
	},
	{
		'saecki/crates.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('crates').setup() -- {
			--	src = {
			--			cmp = {
			--				enabled = true
			--			},
			--		},
			--	}

			local crates = require('crates')

			vim.keymap.set('n', '<leader>ct', crates.toggle, { silent = true, desc = '[C]rates [t]oggle' })
			vim.keymap.set('n', '<leader>cr', crates.reload, { silent = true, desc = '[C]rates [r]eload' })

			vim.keymap.set('n', '<leader>cv', crates.show_versions_popup, { silent = true, desc = '[C]rates [v]ersion' })
			vim.keymap.set('n', '<leader>cf', crates.show_features_popup, { silent = true, desc = '[C]rates [f]eatures' })
			vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup,
				{ silent = true, desc = '[C]rates [d]ependencies' })

			vim.keymap.set('n', '<leader>cu', crates.update_crate, { silent = true, desc = '[C]rates [u]pdate' })
			vim.keymap.set('v', '<leader>cu', crates.update_crates, { silent = true, desc = '[C]rates [u]pdate(s)' })
			vim.keymap.set('n', '<leader>ca', crates.update_all_crates, { silent = true, desc = '[C]rates update [a]ll' })
			vim.keymap.set('n', '<leader>cU', crates.upgrade_crate, { silent = true, desc = '[C]rates [U]pgrade' })
			vim.keymap.set('v', '<leader>cU', crates.upgrade_crates, { silent = true, desc = '[C]rates [U]pgrade(s)' })
			vim.keymap.set('n', '<leader>cA', crates.upgrade_all_crates,
				{ silent = true, desc = '[C]rates upgrade [A]ll' })

			vim.keymap.set('n', '<leader>ce', crates.expand_plain_crate_to_inline_table,
				{ silent = true, desc = '[C]rates [e]xpand plain text' })
			vim.keymap.set('n', '<leader>cE', crates.extract_crate_into_table,
				{ silent = true, desc = '[C]rates [E]xpand' })

			vim.keymap.set('n', '<leader>cH', crates.open_homepage, { silent = true, desc = '[C]rates [H]omegrade' })
			vim.keymap.set('n', '<leader>cR', crates.open_repository, { silent = true, desc = '[C]rates [R]epository' })
			vim.keymap.set('n', '<leader>cD', crates.open_documentation,
				{ silent = true, desc = '[C]rates [D]ocumentation' })
			vim.keymap.set('n', '<leader>cC', crates.open_crates_io, { silent = true, desc = '[C]rates [C]rates.io' })
		end,
	},
}
