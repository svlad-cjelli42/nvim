vim.g.mapleader = " "

local keymap = vim.keymap

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- shift highlight
--keymap.set('n', '<S-Left>', 'v<Left>', { noremap = true})
--keymap.set('n', '<S-Right>', 'v<Right>', { noremap = true})
--keymap.set('n', '<S-Up>', 'v<Up>', { noremap = true})
--keymap.set('n', '<S-Down>', 'v<Down>', { noremap = true})

--keymap.set('v', '<S-Left>', '<Left>', { noremap = true})
--keymap.set('v', '<S-Right>', '<Right>', { noremap = true})
--keymap.set('v', '<S-Up>', '<Up>', { noremap = true})
--keymap.set('v', '<S-Down>', '<Down>', { noremap = true})

--keymap.set('v', 'A', ":'<,'>%norm A", {})
--keymap.set('v', 'I', ":'<,'>%norm I", {})

-- Nvim-Tree
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

-- set jk to escape
keymap.set("i", "jk", "<Esc>", { noremap = false })

-- gitsigns
vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview Hunk"})
vim.keymap.set("n", "<leader>gb", "<cdm>Gitsigns toggle_current_line_blame<CR>", { desc = "Get current line blame"})
