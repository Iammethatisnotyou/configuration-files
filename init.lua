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

vim.g.mapleader = " "  -- Sets the leader key to space

--Use Dvorak-like keybindings
vim.api.nvim_set_keymap("n", "t", "k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "n", "j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "s", "l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "o", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ".", "w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ",", "b", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "t", "k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "n", "j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "s", "l", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "o", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ".", "w", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ",", "b", { noremap = true, silent = true })

--indents single press
vim.api.nvim_set_keymap('n', '<', '<<', { noremap = true })
vim.api.nvim_set_keymap('n', '>', '>>', { noremap = true })

-- Map 'Ctrl+v' to paste from system clipboard in visual or insert
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-v>', '"+p', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "ee", ":lua delete_line()<CR>", { noremap = true, silent = true })

--Control backspace
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-w>', { noremap = true, silent = true })

-- Map 'Ctrl+v' to paste from system clipboard in visual or insert
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-v>', '"+p', { noremap = true, silent = true })

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

vim.api.nvim_set_keymap('n', '<leader>z', ':lua toggle_zen()<CR>', { noremap = true, silent = true })

-- Define commands to toggle Zen mode
vim.cmd('command! Zen lua zen()')
vim.cmd('command! Unzen lua unzen()')

vim.opt.swapfile = false

-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable color syntax
vim.opt.termguicolors = true
vim.cmd("syntax enable")
vim.o.foldmethod = "syntax"

vim.opt.clipboard = "unnamedplus"

vim.o.foldenable = false

vim.o.autoindent = true

vim.opt.wrap = false

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

vim.o.completeopt = "menuone,noselect" -- Better completion experience

vim.o.mouse = 'a'
