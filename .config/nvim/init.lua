--- general setup

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.guicursor = ""

--- lazy.nvim setup

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
  --"github/copilot.vim",
  'stevearc/oil.nvim',
  "hrsh7th/nvim-compe",
  "stevearc/conform.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
})

--- Oil setup

require("oil").setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--- Mason setup

require("mason").setup()
require("mason-lspconfig").setup()

--- Telescope setup

vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, {})

--- LSP setup

local lspconfig = require('lspconfig')
lspconfig.gopls.setup{
  cmd = {"gopls", "--remote=auto"},
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

vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<leader>gh', vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {})

--- Autocompletion setup

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

--- Formatting setup

require("conform").setup({
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters_by_ft = {
    go = { "gofmt" }
  }
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

--- TokyoNight

vim.cmd 'colorscheme tokyonight-night'
