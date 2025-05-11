-- Modularized files located ~.config/nvim/lua
require("keybinds")
require("options")

-- Initialize packer.nvim if not already loaded
vim.cmd [[packadd packer.nvim]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Initialize packer
packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  use "folke/todo-comments.nvim"
  use "mg979/vim-visual-multi"
  use 'dhruvasagar/vim-table-mode'
  use 'rgarber11/jsregexp_windows_prebuilt'

use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons' }
}

-- Basic Lualine setup
require('lualine').setup({
  options = {
    theme = 'tokyonight',  -- Choose your preferred theme (gruvbox, nord, etc.)
    icons_enabled = true,  -- Enable icons in the status line
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_a = {'mode'},  -- Left side - mode (Normal, Insert, etc.)
    lualine_c = {'filename'},  -- Current file name
    lualine_x = {'encoding', 'filetype'},  -- Encoding and file type
    lualine_y = {'progress'},  -- File progress
    lualine_z = {'location'},  -- Line and column number  'filetype'},  -- Encoding and file type
  },
})

use {
  "karb94/neoscroll.nvim",
  config = function()
    require("neoscroll").setup()
  end
}

use {
  'NvChad/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup({
      filetypes = { "*" }, -- Enable for all filetypes
      user_default_options = {
        RGB = true,          -- #RGB hex codes
        RRGGBB = true,       -- #RRGGBB hex codes
        names = false,       -- Disable "name" codes like Blue or Gray
        RRGGBBAA = true,    -- #RRGGBBAA hex codes
        AARRGGBB = true,    -- 0xAARRGGBB hex codes
        rgb_fn = true,       -- CSS rgb() and rgba() functions
        hsl_fn = false,      -- Disable hsl() and hsla()
        css = true,         -- Disable CSS color features
        css_fn = true,      -- Disable CSS functions
        mode = "background", -- Display the hex code background in color
        virtualtext = "■",   -- Show a colored box next to the hex code
        always_update = false,
      },
      buftypes = {},
    })
  end
}
  -- Add nvim-autopairs for auto-pairing brackets, parentheses, etc.
  use {
	'windwp/nvim-autopairs',
	config = function()
  	require('nvim-autopairs').setup{}
	end
  }

  -- Add nvim-cmp and its dependencies
  use {
	'hrsh7th/nvim-cmp',
	requires = {
  	'hrsh7th/cmp-buffer',
  	'hrsh7th/cmp-path',
  	'hrsh7th/cmp-nvim-lsp',
  	'hrsh7th/cmp-cmdline',
  	'L3MON4D3/LuaSnip',
  	'saadparwaiz1/cmp_luasnip',
	},
	config = function()
  	local cmp = require'cmp'
  	local luasnip = require'luasnip'

  	cmp.setup({
    	snippet = {
      	expand = function(args)
        	luasnip.lsp_expand(args.body)
      	end,
    	},
    	mapping = cmp.mapping.preset.insert({
      	['<C-n>'] = cmp.mapping.select_next_item(), -- Use Ctrl+n to select the next item
      	['<C-h>'] = cmp.mapping.select_prev_item(), -- Use Ctrl+h to select the previous item
      	['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Use Tab to confirm selection
      	['<C-d>'] = cmp.mapping.scroll_docs(-4), -- Use Ctrl+d to scroll documentation up
      	['<C-f>'] = cmp.mapping.scroll_docs(4), -- Use Ctrl+f to scroll documentation down
    	}),
    	sources = cmp.config.sources({
      	{ name = 'nvim_lsp' },
      	{ name = 'luasnip' },
    	}, {
      	{ name = 'buffer' },
      	{ name = 'path' },
    	})
  	})

  	-- Setup for command line
  	cmp.setup.cmdline('/', {
    	sources = {
      	{ name = 'buffer' }
    	}
  	})

  	cmp.setup.cmdline(':', {
    	sources = cmp.config.sources({
      	{ name = 'path' }
    	}, {
      	{ name = 'cmdline' }
    	})
  	})
	end
  }

  -- Add tokyonight colorscheme
  use {
	'folke/tokyonight.nvim',
	config = function()
  	vim.cmd('colorscheme tokyonight')
	end
  }

  -- Add other plugins if needed
end)

-- Setup nvim-autopairs
require('nvim-autopairs').setup{}

-- Control backspace to delete current line
function delete_line()
  vim.cmd('normal! ^dd')
  vim.api.nvim_set_keymap("n", "ee", ":lua delete_line()<CR>", { noremap = true, silent = true })

  -- Map Ctrl+H to switch windows in insert mode
  vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', { noremap = true, silent = true })
end

function zen()
  vim.wo.number = false   	-- Disable line numbers
  vim.wo.relativenumber = false -- Disable relative line numbers
  vim.o.laststatus = 0
  vim.wo.signcolumn = 'no'	-- Hide sign column
  vim.wo.cursorline = false   -- Disable cursor line
  vim.wo.foldcolumn = '0' 	-- Hide fold column
  vim.o.showmode = false  	-- Hide mode indicator
  vim.wo.statusline = ''  	-- Hide status line
  vim.o.ruler = false     	-- Hide ruler (column number)
  vim.o.showcmd = false   	-- Hide command in bottom right
  vim.cmd('echo "" | redraw') -- Clear any message in command line
end

-- Function to disable zen mode (restore settings)
function unzen()
  vim.wo.number = true
  vim.wo.relativenumber = true
  vim.o. laststatus = 2
  vim.wo.signcolumn = 'yes'   -- Restore sign column
  vim.wo.cursorlineopt='both'
  vim.wo.foldcolumn = '1' 	-- Restore fold column
  vim.o.showmode = true   	-- Show mode indicator
end

-- Map the function to a keybinding for easy toggling
local is_zen = false

function toggle_zen()
  if is_zen then
	unzen()
	is_zen = false
  else
	zen()
	is_zen = true
  end
end

-- Define commands to toggle Zen mode
vim.cmd('command! Zen lua zen()')
vim.cmd('command! Unzen lua unzen()')

vim.defer_fn(function() -- Make background transparent
    vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
end, 0)

vim.g.netrw_banner = 0 -- Disable the top banner
vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        -- Remap keys
        vim.api.nvim_buf_set_keymap(0, "n", "n", "j", { noremap = true, silent = true })
        vim.api.nvim_buf_set_keymap(0, "n", "t", "k", { noremap = true, silent = true })
    end,
})
