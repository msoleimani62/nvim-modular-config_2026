return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "basedpyright" } })
            local lsp = require("lspconfig")
            lsp.lua_ls.setup({})
            lsp.basedpyright.setup({})
        end,
    },
}
