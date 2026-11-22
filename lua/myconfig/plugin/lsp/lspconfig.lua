-- NOTE: LSP Keybinds
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Buffer local mappings
        local opts = { buffer = ev.buf, silent = true }
        -- Keymaps
        opts.desc = "Show LSP references"
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        vim.keymap.set({ "n", "v" }, "<leader>vca", function() vim.lsp.buf.code_action() end, opts)

        opts.desc = "Smart rename"
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        vim.keymap.set("n", "df", vim.diagnostic.open_float, opts)

        opts.desc = "Signature Help"
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

        opts.desc = "Show documentation for what is under cursor"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        vim.keymap.set("n", "<leader>rs", ":lsp restart<CR>", opts)
    end,
})

-- NOTE: Diagnostic Setup
-- Define sign icons for each severity
local signs = {
    [vim.diagnostic.severity.ERROR] = " ",
    [vim.diagnostic.severity.WARN] = " ",
    [vim.diagnostic.severity.HINT] = "󰠠 ",
    [vim.diagnostic.severity.INFO] = " ",
}

-- update diagnostic config function
vim.diagnostic.config({
    signs = { text = signs },
    --virtual_text = true,
    virtual_text = {
        severity = { min = vim.diagnostic.severity.ERROR } -- only show ERROR level messages
    },
    underline = true,  -- Always on
    update_in_insert = false,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
    },
    diagnosticSeverityOverrides = {
        E251 = 'none',
        E501 = 'none',
    },
})

-- <leader>lx toggle for virtual text (no hover changes)
vim.keymap.set('n', '<leader>lx', function()
    local current = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({
        virtual_text = not current, -- toggle true/false
    })
    vim.notify(
        "Diagnostics virtual text " .. (not current and "enabled" or "disabled"),
        vim.log.levels.INFO,
        { title = "Diagnostics" }
    )
end, { desc = "Toggle diagnostic virtual text" })

-- NOTE: Setup servers

-- Native LSP capabilities 
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Global LSP settings (applied to all servers)
vim.lsp.config('*', {
    capabilities = capabilities
})

-- Configure and enable LSP servers
-- lua_ls
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            completion = {
                callSnippet = "Replace",
            },
            -- workspace = {
            --     library = {
            --         [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            --         [vim.fn.stdpath("config") .. "/lua"] = true,
            --     },
            -- },
        },
    },
})

-- Pyright LSP configuration (autocomplete, type checking, hover docs)
vim.lsp.config('pyright', {
    cmd = {'pylsp'},
    filetypes = {'python'},
    settings = {
        pyright = {
            useLibraryCodeForTypes = true,
        },
        python = {
            analysis = {
                typeCheckingMode = 'basic',
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'workspace',
                index = true,
                autoImportCompletions = true,
            },
        },
    },
    root_markers = { 'pyproject.toml', 'setup.py', 'requirements.txt', '.git', '.venv', 'venv', 'uv.lock' },
})


-- rust
vim.lsp.config("rust_analyzer", {
    filetypes = { "rust" },
    settings = {
        ["rust-analyzer"] = {
            -- clippy is just better
            check = {
                command = "clippy",
            },
            -- off by default (very much needed)
            procMacro = {
                enable = true,
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
                allFeatures = true,
            },
        },
    },
})

-- Enable install lsp either locally or via mason
vim.lsp.enable({
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "clangd"

})
