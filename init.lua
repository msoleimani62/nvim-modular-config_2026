-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

-- Load core settings
require("core")

-- Load plugins
require("lazy").setup({
    { import = "plugins.ui" },
    { import = "plugins.editor" },
    { import = "plugins.lsp" },
    { import = "plugins.tools" },
    { import = "plugins.extras" },
}, {
    defaults = { lazy = true },
    performance = {
        rtp = {
            disabled_plugins = { "gzip", "zip", "tar", "tutor", "matchit", "matchparen", "rplugin" },
        },
    },
})
