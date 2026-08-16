-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Use Telescope as the picker backend; it remains compatible with mini.starter.
vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_explorer = "neo-tree"

-- vim.g.mapleader = " "

opt.relativenumber = false

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
