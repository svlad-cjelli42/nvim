

vim.pack.add({
    -- plugin dependencies
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    -- auto bracketing
    { src = "https://github.com/windwp/nvim-autopairs" },
    -- auto completion
    { src = "https://github.com/hrsh7th/nvim-cmp" },
    { src = "https://github.com/hrsh7th/cmp-path" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/onsails/lspkind.nvim" },
    -- better tabs
    { src = "https://github.com/akinsho/bufferline.nvim", version = "*" },
    -- bottom line
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    -- file explorer
    { src = "https://github.com/nvim-tree/nvim-tree.lua" },
    -- search functionality
    { src = "https://github.com/nvim-telescope/telescope.nvim", branch = "0.1.x" },
    -- built in terminal
    { src = "https://github.com/akinsho/toggleterm.nvim" },
    -- help remember keybindings
    { src = "https://github.com/folke/which-key.nvim" },
    -- navigation between windows
    { src = "https://github.com/christoomey/vim-tmux-navigator" },
    -- file explorer dressing box
    { src = "https://github.com/stevearc/dressing.nvim" },
    -- GIT
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    -- LSP plugins
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
})

require("myconfig.plugin.autopairs")
require("myconfig.plugin.bufferline")
require("myconfig.plugin.svlads-theme").colorscheme()
require("myconfig.plugin.init")
require("myconfig.plugin.lualine")
require("myconfig.plugin.nvim-cmp")
require("myconfig.plugin.nvim-tree")
require("myconfig.plugin.telescope")
require("myconfig.plugin.toggleterm")
require("myconfig.plugin.which-key")
require("myconfig.plugin.gitsigns")
require("myconfig.plugin.lsp.mason") -- mason has to load before lspconfig
require("myconfig.plugin.lsp.lspconfig")
