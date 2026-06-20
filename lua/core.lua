-- =====================
-- تنظیمات پایه
-- =====================
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

-- undo directory
local undodir = vim.fn.stdpath("data") .. "/undo"
if vim.fn.isdirectory(undodir) == 0 then vim.fn.mkdir(undodir, "p") end
opt.undodir = undodir

-- =====================
-- Leader
-- =====================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- =====================
-- Keymaps
-- =====================
local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { desc = desc, noremap = true, silent = true })
end

-- فایل
map("n", "<leader>w", "<cmd>w<CR>", "Save File")
map("n", "<leader>q", "<cmd>q<CR>", "Quit")
map("n", "<leader>Q", "<cmd>qa!<CR>", "Force Quit All")

-- پنجره‌ها
map("n", "<C-h>", "<C-w>h", "Move Left")
map("n", "<C-j>", "<C-w>j", "Move Down")
map("n", "<C-k>", "<C-w>k", "Move Up")
map("n", "<C-l>", "<C-w>l", "Move Right")
map("n", "<C-Up>", "<cmd>resize +2<CR>", "Resize Up")
map("n", "<C-Down>", "<cmd>resize -2<CR>", "Resize Down")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", "Resize Left")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", "Resize Right")

-- اسکرول
map("n", "<C-d>", "<C-d>zz", "Scroll Down")
map("n", "<C-u>", "<C-u>zz", "Scroll Up")
map("n", "n", "nzzzv", "Next Search")
map("n", "N", "Nzzzv", "Prev Search")
map("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear Search")

-- انتقال خطوط
map("v", "J", ":m '>+1<CR>gv=gv", "Move Line Down")
map("v", "K", ":m '<-2<CR>gv=gv", "Move Line Up")
map("n", "J", "mzJ`z", "Join Lines")

-- کپی/پیست
map({ "n", "v" }, "<leader>y", '"+y', "Yank to Clipboard")
map("n", "<leader>Y", '"+Y', "Yank Line to Clipboard")
map({ "n", "v" }, "<leader>p", '"+p', "Paste from Clipboard")
map("x", "<leader>p", '"_dP', "Paste No Register")
map({ "n", "v" }, "<leader>d", '"_d', "Delete No Yank")

-- جایگزینی
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace Word")

-- بافر
map("n", "<leader>x", "<cmd>bdelete<CR>", "Close Buffer")
map("n", "<Tab>", "<cmd>bnext<CR>", "Next Buffer")
map("n", "<S-Tab>", "<cmd>bprevious<CR>", "Prev Buffer")

-- =====================
-- Autocmds
-- =====================
local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- چک کردن تغییرات فایل از بیرون
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    group = augroup,
    command = "checktime",
})

-- حذف فاصله‌های اضافه هنگام ذخیره
vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    callback = function()
        local pos = vim.fn.getpos(".")
        vim.cmd([[:keepjumps %s/\s\+$//e]])
        vim.fn.setpos(".", pos)
    end,
})

-- تنظیم اندازه پنجره‌ها هنگام resize
vim.api.nvim_create_autocmd("VimResized", {
    group = augroup,
    command = "tabdo wincmd =",
})

-- هایلایت هنگام کپی
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup,
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
    end,
})

-- treesitter builtin برای فایل‌های کد
vim.api.nvim_create_autocmd("FileType", {
    group = augroup,
    pattern = { "python", "lua", "bash", "json", "yaml", "markdown" },
    callback = function()
        pcall(vim.treesitter.start)
    end,
})
