local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.termguicolors = true
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.mouse = "a"
opt.ignorecase = true
opt.smartcase = true
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true
local undodir = vim.fn.stdpath("data") .. "/undo"
if vim.fn.isdirectory(undodir) == 0 then vim.fn.mkdir(undodir, "p") end
opt.undodir = undodir
opt.signcolumn = "yes"
opt.updatetime = 200
opt.timeoutlen = 300
opt.colorcolumn = "80"
opt.clipboard = "unnamedplus"
opt.splitbelow = true
opt.splitright = true
opt.completeopt = { "menu", "menuone", "noselect" }
opt.confirm = true
opt.pumheight = 10
opt.laststatus = 3
opt.cmdheight = 1
opt.showmode = false
opt.shortmess:append("c")
opt.inccommand = "split"
opt.virtualedit = "block"
opt.fillchars = { eob = " " }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { desc = desc, noremap = true, silent = true })
end

map("n", "<leader>w", "<cmd>w<CR>", "Save File")
map("n", "<leader>q", "<cmd>q<CR>", "Quit")
map("n", "<C-h>", "<C-w>h", "Move Left")
map("n", "<C-j>", "<C-w>j", "Move Down")
map("n", "<C-k>", "<C-w>k", "Move Up")
map("n", "<C-l>", "<C-w>l", "Move Right")
map("n", "<C-d>", "<C-d>zz", "Scroll Down")
map("n", "<C-u>", "<C-u>zz", "Scroll Up")
map("n", "n", "nzzzv", "Next Search")
map("n", "N", "Nzzzv", "Prev Search")
map("v", "J", ":m '>+1<CR>gv=gv", "Move Line Down")
map("v", "K", ":m '<-2<CR>gv=gv", "Move Line Up")
map("n", "J", "mzJ`z", "Join Lines")
map({ "n", "v" }, "<leader>y", '"+y', "Yank")
map("n", "<leader>Y", '"+Y', "Yank Line")
map({ "n", "v" }, "<leader>p", '"+p', "Paste")
map("x", "<leader>p", '"_dP', "Paste No Register")
map({ "n", "v" }, "<leader>d", '"_d', "Delete No Yank")
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace")
map("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear Search")

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, { group = augroup, command = "checktime" })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    callback = function()
        local pos = vim.fn.getpos(".")
        vim.cmd([[:keepjumps %s/\s\+$//e]])
        vim.fn.setpos(".", pos)
    end,
})
vim.api.nvim_create_autocmd("VimResized", { group = augroup, command = "tabdo wincmd =" })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup,
    callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 }) end,
})
