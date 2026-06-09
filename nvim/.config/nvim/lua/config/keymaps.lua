-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "<C-\\>", "<C-W>", { desc = "Delete previous word" })
vim.keymap.set("n", "<C-\\>", "a<C-W><Esc>", { desc = "Delete previous word" })
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

vim.keymap.set("i", "lkj", "<Esc>", { desc = "Go to Insert Mode #1" })
vim.keymap.set("n", "lkj", "i", { desc = "Go to Insert Mode #1" })
vim.keymap.set("i", "KJ", "<Esc>", { desc = "Go to Insert Mode #2" })
vim.keymap.set("n", "KJ", "i", { desc = "Go to Insert Mode #2" })
vim.keymap.set("i", "LKJ", "<Esc>", { desc = "Go to Insert Mode #3" })
vim.keymap.set("n", "lkj", "i", { desc = "go to insert mode #3" })
vim.keymap.set("i", "JJ", "<Esc>", { desc = "Go to Insert Mode #4" })
vim.keymap.set("n", "JJ", "i", { desc = "go to insert mode #4" })
vim.keymap.set("i", "KK", "<Esc>", { desc = "Go to Insert Mode #5" })
vim.keymap.set("n", "KK", "i", { desc = "go to insert mode #5" })

vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

vim.keymap.set("n", "j", "jzz", { desc = "Cursor at the middle of the screen while pressing j" })
vim.keymap.set("n", "k", "kzz", { desc = "Cursor at the middle of the screen while pressing k" })

vim.keymap.set("n", "[<leader>", "O<Esc>j", { desc = "Insert Empty Line Above" })
vim.keymap.set("n", "]<leader>", "o<Esc>k", { desc = "Insert Empty Line Below" })

vim.keymap.set("n", "<A-h>", ":%:s/", { desc = "Search and Replace Shortcut" })

vim.keymap.set({ "n", "x" }, "<leader>dd", '"_d', { desc = "Delete to black hole register" })
vim.keymap.set({ "n", "x" }, "<leader>D", '"_D', { desc = "Delete to end of line to black hole register" })
vim.keymap.set({ "n", "x" }, "<leader>x", '"_x', { desc = "Delete character to black hole register" })
vim.keymap.set({ "n", "x" }, "<leader>cc", '"_c', { desc = "Delete content" })

vim.keymap.set("n", "<A-L>", "<C-w><lt><C-w><lt><C-w><lt>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<A-H>", "<C-w>><C-w>><C-w>>", { desc = "Increase Window Width" })

vim.keymap.set("n", "<A-K>", "<C-w>-<C-w>-<C-w>-", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<A-J>", "<C-w>+<C-w>+<C-w>+", { desc = "Increase Window Width" })

vim.keymap.set("n", "<leader>r", ":SnipRun<CR>", { desc = "Run the Code (SnipRun)" })
vim.keymap.set("v", "<leader>r", ":'<,'>SnipRun<CR>", { desc = "Run the Code (SnipRun)" })

vim.keymap.set(
  "n",
  "gpd",
  "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
  { desc = "Goto preview definition", noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", {
  desc = "Goto preview type definition",
  noremap = true,
  silent = true,
})

vim.keymap.set("n", "<leader>gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", {
  desc = "Goto preview implementation",
  noremap = true,
  silent = true,
})

vim.keymap.set("n", "<leader>gpD", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>", {
  desc = "Goto preview declaration",
  noremap = true,
  silent = true,
})

vim.keymap.set("n", "<leader>gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", {
  desc = "Close all preview windows",
  noremap = true,
  silent = true,
})

vim.keymap.set("n", "<leader>gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", {
  desc = "Goto preview references",
  noremap = true,
  silent = true,
})

vim.keymap.set("n", "<leader>rr", ":RunCode<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })
