-- ========================================================================== --
-- ==                           EDITOR SETTINGS                            == --
-- ========================================================================== --

-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Can be used in [A]ll modes
vim.opt.mouse = 'a'

-- Ignore case when searching unless word contains uppercase letter (Probably change this wording in the future. Still learning)
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlight results when searching
vim.opt.hlsearch = true

vim.opt.wrap = true -- Will display line on the next line if bigger than width of window
vim.opt.breakindent = true -- Continue indentation for wrapped lines

-- Set tabs to 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

-- Gets rid of help banner at the top of netrw
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Save undo history
vim.opt.undofile = true

-- ========================================================================== --
-- ==                             KEYBINDINGS                              == --
-- ========================================================================== --

-- Space as leader key
vim.g.mapleader = ' '

-- Shortcuts
vim.keymap.set({'n', 'x', 'o'}, '<leader>h', '^', { desc = "Go to first non-blank char on line" }) -- Takes me to the first non-blank char on the line
vim.keymap.set({'n', 'x', 'o'}, '<leader>l', 'g_', { desc = "Go to last non-blank char on line" }) -- Takes me to the last non-blank char on the line
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>', { desc = "Select the whole contents of the file" }) -- Selects the whole contents of the file in [visual mode]. gg -> V -> G 

-- Basic clipboard interaction
vim.keymap.set({'n', 'x'}, 'gy', '"+y') -- copy
vim.keymap.set({'n', 'x'}, 'gp', '"+p') -- paste

-- Delete text
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set({'n', 'x'}, 'X', '"_d')

-- Commands
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', { desc = "[W]rite file" }) -- Write file 
vim.keymap.set('n', '<leader>bq', '<cmd>bdelete<cr>')
vim.keymap.set('n', '<leader>bl', '<cmd>buffer #<cr>')
vim.keymap.set('n', '<leader><space>', '<cmd>buffers<cr>:buffer<Space>')
vim.keymap.set('n', '<leader>e', '<cmd>Lexplore %:p:h<cr>')
vim.keymap.set('n', '<leader>E', '<cmd>Lexplore<cr>') -- Toggles netrw in split window to the left

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Remove highlight on search result when I hit esc

local function netrw_mapping()
  local bufmap = function(lhs, rhs)
    local opts = {buffer = true, remap = true}
    vim.keymap.set('n', lhs, rhs, opts)
  end

  -- close window
  bufmap('<leader>e', ':Lexplore<cr>')
  bufmap('<leader>E', ':Lexplore<cr>')

  -- Go back in history
	--
  bufmap('H', 'u')

  -- Go up a directory
  bufmap('h', '-^')

  -- Open file/directory
  bufmap('l', '<cr>')

  -- Open file/directory then close explorer
  bufmap('L', '<cr>:Lexplore<CR>')

  -- Toggle dotfiles
  bufmap('.', 'gh')
end


-- ========================================================================== --
-- ==                               COMMANDS                               == --
-- ========================================================================== --

vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

local group = vim.api.nvim_create_augroup('user_cmds', {clear = true})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = group,
  desc = 'Highlight on yank',
  callback = function()
    vim.highlight.on_yank({higroup = 'Visual', timeout = 200})
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'help', 'man'},
  group = group,
  command = 'nnoremap <buffer> q <cmd>quit<cr>'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  group = group,
  desc = 'Keybindings for netrw',
  callback = netrw_mapping
})


-- ========================================================================== --
-- ==                         PLUGIN CONFIGURATION                         == --
-- ========================================================================== --


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "nvim-lualine/lualine.nvim" },
	{ "kyazdani42/nvim-web-devicons" },
	{ "akinsho/bufferline.nvim" },
	{ "numToStr/Comment.nvim" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "lewis6991/gitsigns.nvim" },
	{ "nvim-telescope/telescope.nvim", branch = '0.1.x' },
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
})

-- ========================================================================== --
-- ==                         PLUGIN CONFIGURATION                         == --
-- ========================================================================== --

---
-- Colorscheme (Catppuccin)
---
vim.opt.termguicolors = true
vim.cmd.colorscheme('catppuccin')

---
-- lualine.nvim (statusline)
---
vim.opt.showmode = false

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    component_separators = '|',
    section_separators = '',
  },
})

---
-- bufferline.nvim (A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.)
---
require("bufferline").setup({
	options = {
		mode = "buffers",
		offsets = {
			{ filetype = "netrw" }
		},
	},
})

---
-- Comment.nvim (🧠 💪 // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more)
---
require("Comment").setup()

---
-- Indent Blankline (Indent guides for Neovim) 
---
require("ibl").setup()

---
-- Gitsigns ( Git integration for buffers )
---
require('gitsigns').setup({
  signs = {
    add = {text = '▎'},
    change = {text = '▎'},
    delete = {text = '➤'},
    topdelete = {text = '➤'},
    changedelete = {text = '▎'},
  }
})

---
-- Telescope (Find, Filter, Preview, Pick. All lua, all the time.) 
--
require("telescope").setup({
})

-- Telescope Keymaps
local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = "[S]earch [K]eymaps" })

-- Enable Telescope extensions if they are installed
require('telescope').load_extension('fzf')
