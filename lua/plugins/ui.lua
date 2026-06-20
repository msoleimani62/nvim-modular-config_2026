-- =====================
-- UI پلاگین‌های ظاهری
-- =====================
return {

    -- تم catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                transparent_background = true,
                integrations = {
                    nvimtree = true,
                    telescope = true,
                    which_key = true,
                    indent_blankline = { enabled = true },
                    bufferline = true,
                    gitsigns = true,
                    noice = true,
                    notify = true,
                    treesitter = true,
                    treesitter_context = true,
                },
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },

    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = { "catppuccin/nvim" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "catppuccin",
                    icons_enabled = false,
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { { "filename", path = 1 } },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
            })
        end,
    },

    -- bufferline
    {
        "akinsho/bufferline.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("bufferline").setup({
                options = {
                    numbers = "ordinal",
                    diagnostics = "nvim_lsp",
                    separator_style = "thin",
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                },
            })
            vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
            vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
        end,
    },

    -- dashboard
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require("dashboard").setup({
                theme = "hyper",
                config = {
                    week_header = { enable = true },
                    shortcut = {
                        { desc = "Files",   group = "Label", action = "Telescope find_files", key = "f" },
                        { desc = "Grep",    group = "Label", action = "Telescope live_grep",  key = "g" },
                        { desc = "Mason",   group = "Label", action = "Mason",                key = "m" },
                        { desc = "Lazy",    group = "Label", action = "Lazy",                 key = "l" },
                        { desc = "Quit",    group = "Label", action = "qa",                   key = "q" },
                    },
                },
            })
        end,
    },

    -- noice -- UI بهتر برای cmdline و messages
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                cmdline = {
                    enabled = true,
                    view = "cmdline_popup",
                },
                messages = { enabled = true },
                popupmenu = {
                    enabled = true,
                    backend = "nui",
                },
                lsp = {
                    progress = { enabled = false },
                    hover = { enabled = true },
                    signature = { enabled = true },
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                    },
                },
                presets = {
                    bottom_search = true,
                    command_palette = true,
                    long_message_to_split = true,
                },
            })
        end,
    },

    -- indent lines
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        main = "ibl",
        config = function()
            require("ibl").setup({
                indent = { char = "▏" },
                scope = { enabled = true },
            })
        end,
    },

    -- which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-key").setup()
        end,
    },

    -- illuminate -- هایلایت کلمه زیر cursor
    {
        "RRethy/vim-illuminate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("illuminate").configure({ delay = 0 })
        end,
    },
}
