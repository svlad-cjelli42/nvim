local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

mason_lspconfig.setup({
    automatic_enable = false, -- set true to enable all LSP in `ensure_installed`
    ensure_installed = {
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "clangd"
    },
})

mason_tool_installer.setup({
    ensure_installed = {
        "prettier",
        "clangd"
    },

})
