vim.g.mapleader = " "

local map = vim.keymap.set

-- center
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- move line up/down
map('n', '<A-j>', ':m .+1<CR>==', {})
map('n', '<A-k>', ':m .-2<CR>==', {})
map('v', '<A-j>', ":m '>+1<CR>gv-gv", {})
map('v', '<A-k>', ":m '<-2<CR>gv-gv", {})

-- better indent
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- holy based
-- map({ "n", "v", "x" }, ";", ":", { desc = "Self explanatory" })
-- map({ "n", "v", "x" }, ":", ";", { desc = "Self explanatory" })

-- use system clipboard
map({ "n", "x" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
map({ "n", "x" }, "<leader>d", '"+d', { desc = "Cut to system clipboard" })
map({ "n", "x" }, "<leader>Y", '"+y$', { desc = "Copy to end of line to system clipboard" })
map({ "n" }, "Y", "y$", { desc = "Copy to end of line" })

-- format and save
map('n', '<C-s>', function()
  vim.lsp.buf.format()
  vim.cmd('write')
end, { noremap = true, silent = true })

map('i', '<C-s>', function()
  vim.api.nvim_input('<Esc>')
  vim.lsp.buf.format()
  vim.cmd('write')
  vim.api.nvim_input('a')
end, { noremap = true, silent = true })

-- exit
map({ "n" }, "<leader>q", "<Cmd>:quit<CR>", { desc = "Quit the current buffer." })
map({ "n" }, "<leader>Q", "<Cmd>:wqa<CR>", { desc = "Quit all buffers and write." })

-- source
map({ "n" }, "<leader>o", "<Cmd>source %<CR>", { desc = "Source " .. vim.fn.expand("$MYVIMRC") })
map({ "n" }, "<leader>O", "<Cmd>:Lazy reload<CR>", { desc = "Restart vim" })

map("n", "<leader>R", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Enter substitue mode with word" })
map("v", "<leader>r", [[:s/\V]], { desc = "Enter substitue mode in selection" })
-- map("n", "<Esc>", "<Esc>:nohlsearch<CR>", { desc = "Clear highlight" })
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
map({ "n", "v", "x" }, "<leader>n", ":norm", { desc = "norm" })


-- lsp
map("n", "K", vim.lsp.buf.hover, { desc = "Lsp hover info" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- error
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show errors" })
map("n", "[e", vim.diagnostic.goto_next, { desc = "Goto next error" })
map("n", "]e", vim.diagnostic.goto_next, { desc = "Goto prev error" })

-- window
map("n", "<leader>wv", ":vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>wx", ":split<CR>", { desc = "Horizontal split" })
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- move between windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
