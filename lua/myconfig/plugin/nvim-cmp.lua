require('cmp').setup({
    completion = {
        completeopt = "menu,menuone,preview,noselect",
    },
    snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = require('cmp').mapping.preset.insert({
        ["<C-k>"] = require("cmp").mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = require("cmp").mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = require("cmp").mapping.scroll_docs(-4),
        ["<C-f>"] = require("cmp").mapping.scroll_docs(4),
        ["<C-Space>"] = require("cmp").mapping.complete(), -- show completion suggestions
        ["<C-e>"] = require("cmp").mapping.abort(), -- close completion window
        ["<CR>"] = require("cmp").mapping.confirm({ select = false }),
    }),
    -- sources for autocompletion
    sources = require('cmp').config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "path" }, -- file system paths
    }),
    -- configure lspkind for vs-code like pictograms in completion menu
    formatting = {
        format = require("lspkind").cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
        }),
    },
})

-- import nvim-autopairs completion functionality
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

-- import nvim-cmp plugin (completions plugin)
local cmp = require("cmp")

-- make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- bufferline config
require('bufferline').setup({})

-- lualine config

require('lualine').setup({
    options = {
        theme = 'ayu_dark',
    },
})
