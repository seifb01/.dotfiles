--- lazy.nvim setup ######

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  "folke/tokyonight.nvim",
  "nvim-lua/plenary.nvim",
  "neovim/nvim-lspconfig",
  "nvim-lualine/lualine.nvim",
  "github/copilot.vim",
  "hrsh7th/nvim-compe",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
})

--- Mason setup ######

require("mason").setup()
require("mason-lspconfig").setup()

--- Telescope setup ######

local builtin_telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin_telescope.find_files, {})

--- Lualine setup ######

local builtin_lualine   = require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

--- LSP setup ######

local lspconfig = require('lspconfig')
lspconfig.gopls.setup{
  cmd = {"gopls", "--remote=auto"}, -- adjust this if gopls is not in your PATH
  filetypes = {"go", "gomod"},
  root_dir = lspconfig.util.root_pattern(".git","go.mod","."),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

--- Autocompletion setup ######

require('compe').setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
    vsnip = true,
    treesitter = true,
  },
}
vim.opt.completeopt = "menuone,noselect"

--- TokyoNight  ######

vim.cmd 'colorscheme tokyonight-night'
